# Aliases
alias roll="rolldice"
alias journal="pass edit personal/journal/$(date +"%Y-%m-%d")"

# urxvt unicode color bug fix
TERM='xterm-256color'

# Mindstand stuff
NEO_VOLUME_LOC=$HOME/Documents/mindstand/testing

# Style
QT_QPA_PLATFORMTHEME=gtk2

# set default editor to vim
export EDITOR="/usr/bin/vim"

# PATH config
export PATH="/usr/bin/"
PATH="$PATH:$HOME/.local/bin/"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:/usr/local/sbin"
PATH="$PATH:$HOME/.bin/"

# Custom environments
PATH="$PATH:$HOME/envs/perl/"
PATH="$PATH:$HOME/envs/conda/bin"

# CUDA
PATH="$PATH:/opt/cuda/bin"

# PERL
PATH="$PATH:/usr/bin/site_perl"
PATH="$PATH:/usr/bin/vendor_perl"
PATH="$PATH:/usr/bin/core_perl"

