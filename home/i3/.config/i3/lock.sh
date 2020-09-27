#!/bin/bash

i3-msg 'workspace 11'
sxiv -A 40 -a ~/dotfiles/aesthetics/.wallpapers/pixels5.gif -f -b &

sleep 0.4 && i3-msg 'workspace 12' &
sxiv -A 40 -a ~/dotfiles/aesthetics/.wallpapers/pixels3.gif -f -b &

unclutter -idle 0.01 -root &
xtrlock &&
kill $(ps -C sxiv)

i3-msg 'workspace 1'

sleep 0.4 && i3-msg 'workspace 6' 
