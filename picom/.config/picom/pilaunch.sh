#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

if $(ps -C "picom" | grep -qi "picom"); then
    kill $(ps -C picom)
    sleep 3
    picom --config picom.conf
else
    picom --config picom.conf
fi
