"""
Meant to be an end all / be all solution for doing live color 
switching for templated dotfiles. Relies on pywal.

Assumes that template files are stowed in a ~/dotfiles directory
and are deployed using gnu stow
"""

import os
import shutil
import random
import argparse
import tempfile
import subprocess
from pathlib import Path

try:
  import pywal 
except:
  subprocess.run(["pip", "install", "--user", "git+https://github.com/dylanaraps/pywal.git"])
  import pywal

########## UTIL ###########

# Dict flattener snagged from stack exchange
def flat_dict(sample_dict):
  out_dict = {}
  for key, val in sample_dict.items():
    if type(val) == dict:
      out_dict[key] = len(sample_dict.keys())
      out_dict.update(val)
    else:
      out_dict[key] = val
 
  return out_dict

def parse():
  home = Path(os.environ["HOME"])

  parser = argparse.ArgumentParser(description="Options for colorswap")

  parser.add_argument("--light", dest="light", type=str, default="",
                      help="Whether theme is light or not (True/False)")

  parser.add_argument("--img", dest="img", type=str, default="",
                      help=("Source image for colors (random from\n" + 
                            "~/Pictures/wallpapers by default). \n" + 
                            "current:     current wallpaper \n" + 
                            "random:      random wallpaper \n" +
                            "[filename]:  ~/Pictures/wallpapers/filename \n"))

  args = parser.parse_args()

  # Process light option
  if (args.light.lower() in ["y", "yes", "true", "t", "1"]):
    args.light = True 
  elif (args.light.lower() in ["n", "no", "false", "0", ""]):
    args.light = False

  # Process source image option
  pics = home / "Pictures" / "wallpapers"
  if (args.img == "current"):
    args.img = pywal.wallpaper.get()
  elif (args.img in ["", "random"]):
    args.img = pywal.image.get(pics)
  else:
    args.img = pics / args.img

  return args

############ TEMPLATING ###############

def fill_templates(light, image):
  """
  Chooses an image and fills templates with colors from that image.
  """

  home = Path(os.environ["HOME"])
  print("Generating colorscheme from", image, '\n')

  # Find template files
  dots = home / "dotfiles"
  templates  = list(dots.rglob("*.template"))

  # Select colors
  colors = flat_dict(pywal.colors.get(str(image), light=light))

  # Apply colors to all templates
  print("Filling templates:")
  for i in templates:
      filename = i.stem.split('.template')[0]
      realpath = i.parents[0] / filename
      print(realpath)

      pywal.export.template(colors = colors, 
                            input_file = i, 
                            output_file = realpath)

  # Make image the background
  pywal.wallpaper.change(image)

# Reloads assets
def reload_resources():
    """
    Reloads a bunch of resources
    """
    
    home = Path(os.environ["HOME"])

    # Live reload gtk
    if shutil.which("xsettingsd"):
      fd, path = tempfile.mkstemp()
      try:
          with os.fdopen(fd, 'w+') as tmp:
              tmp.write('Net/ThemeName "FlatColor"\n')
              tmp.close()
              subprocess.run(["timeout", "0.2s", "xsettingsd", "-c", path],
                            stdout = subprocess.DEVNULL,
                            stderr = subprocess.DEVNULL)
      finally:
              os.remove(path)

    # Reload xresources
    xpath = home / "dotfiles" / "home" / "x" / ".Xresources"
    subprocess.run(["xrdb", xpath], 
                    stdout=subprocess.DEVNULL,
                    stderr = subprocess.DEVNULL)

    # Reload i3
    subprocess.run(["i3-msg", "restart"], 
                    stdout = subprocess.DEVNULL,
                    stderr = subprocess.DEVNULL)


###############################

args = parse()
fill_templates(args.light, args.img)
reload_resources()