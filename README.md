# kwkaiser's dotfiles

### deployment
Dotfiles are meant to be deployed with [GNU stow](https://www.gnu.org/software/stow/), which is why they're organized in a sort of funky way. All dotfiles are stowed to the home directory and shouldn't require elevated privileges, except for those in:

* pulseaudio
* scripts
* systemd
* vfio

Those directories may be stowed with the --target option, often to /etc/.

### wpgtk 
[wpgtk](https://github.com/deviantfero/wpgtk) can things feel somewhat complicated and difficult to contain if you try to have a fillable theme for every application, so when possible, use .Xresources as the basis of themes in applications. Currently, wpgtk is only used for:

* gtk
* rofi
* Xresources

With regards to wpgtk's usage, it always creates a "filled" version of a base template in the templates directory. To have the "filled" template be in the expected directory, I just softlinked a file in the correct location to the wpgtk templates directory, and it correctly fills it in.

### x
The .Xresources file pretty much conglomerates application-specific or color-specific settings in the .Xresources.d directory. It should stay that ways for the sake of not having a messy config.
