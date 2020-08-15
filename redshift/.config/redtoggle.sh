#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if $(ps -C "redshift" | grep -qi "redshift"); 
then
    kill $(ps -C "redshift");
else
    redshift -c ./redshift.conf;
fi
