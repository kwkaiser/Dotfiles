"""
Meant to be an end all / be all solution for doing live color 
switching for templated dotfiles. Relies on pywal.

Assumes that template files are stowed in a ~/dotfiles directory
and are deployed using gnu stow
"""

import os
import shutil
import random
import tempfile
import subprocess
from pathlib import Path

try:
  import pywal 
except:
  subprocess.run(["pip", "install", "--user", "git+https://github.com/dylanaraps/pywal.git"])
  import pywal

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

def reload_resources(home):
    """
    Reloads a bunch of resources
    """
    
    home = Path(home)

    # Live reload gtk
    if shutil.which("xsettingsd"):
      fd, path = tempfile.mkstemp()
      try:
          with os.fdopen(fd, 'w+') as tmp:
              tmp.write('Net/ThemeName "FlatColor"\n')
              tmp.close()
              subprocess.run(["timeout", "0.2s", "xsettingsd", "-c", path],
                            stdout = subprocess.DEVNULL)
      finally:
              os.remove(path)

    # Reload xresources
    xpath = home / "dotfiles" / "x" / ".Xresources"
    subprocess.run(["xrdb", xpath], 
                    stdout=subprocess.DEVNULL)

    # Reload i3
    subprocess.run(["i3-msg", "restart"], 
                    stdout = subprocess.DEVNULL)

def fill_templates(home):
  """
  Chooses an image and fills templates with colors from that image.
  """

  home = Path(home)

  # Choose random image
  images = home / "Pictures" / "wallpapers"
  image  = pywal.image.get(images)
  print("Generating colorscheme from", image, '\n')

  # Find template files
  dots = home / "dotfiles"
  templates  = list(dots.rglob("*.template"))

  # Select colors
  colors = flat_dict(pywal.colors.get(image))

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

###############################

home = Path(os.environ["HOME"])

fill_templates(home)
reload_resources(home)