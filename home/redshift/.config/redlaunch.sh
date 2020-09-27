#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR 

if $(systemctl --user is-active -q redshift)
then
   $(systemctl --user stop redshift)
else
    systemctl --user start redshift
fi
