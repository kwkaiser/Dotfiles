# kwkaiser's dotfiles

### deployment
Dotfiles are meant to be deployed with [GNU stow](https://www.gnu.org/software/stow/), which is why they're organized in a sort of funky way. Ideally, a user should be able to ```cd``` into the relevant directory and use:

* ```stow --target=/home/kwkaiser *```
* ```stow --target=/etc/ *```

Additionally, several config files and themes are templated (e.g. have ```.template``` suffix). Any template within the ```~/dotfiles``` directory can be filled through pywal and xsettingsd