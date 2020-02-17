#!/bin/bash

if [ $# -eq 0 ]; then
    echo "You didn't give a path to restore, aborting"
    exit
fi
if [ ! -f "$1" ]; then
    echo "No backup found at '$1', aborting"
    exit
fi

filename="${1%.*}"

pigz -dkf "$1"
mv "$filename" desertbus.db3
ln -f desertbus.db3 desertbus.db3.weekly
ln -f desertbus.db3 desertbus.db3.monthly

echo "### Done!"
