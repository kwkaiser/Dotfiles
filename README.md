# dotfiles:

The dotfiles for my computers. Note that wpgtk is easily implemented but is not required by default.
Currently, each config file has it's normal config, and a corresponding config.base file. wpgtk's 
templates directory contains, for each base config:
  - A symlink to the base config, so that base configs can be edited in their normal folders (e.g.
    "~/dotfiles/i3/.config/i3/i3.base") instead of the wpgtk folder ("~/dotfiles/wpgtk/..."). This
    templates directory also includes a symlink to the actual config, which is edited wrt the base.
    Thus, any edits should be made to the base file and will be automatically updated to the real
    config.
