# Aliases
alias roll="rolldice"

# urxvt unicode color bug fix
TERM='xterm-256color'

# CUDA setup
# PATH="/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/NsightCompute-2019.1${PATH:+:${PATH}}"

# set default editor to vim
VISUAL="vim"
EDITOR="$VISUAL"

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
