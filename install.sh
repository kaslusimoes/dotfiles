#!/bin/bash

for folder in $PWD/*; do
    if [ -f $folder ]; then
        echo "$folder is a file, skipping."
    else
        echo "$folder" | cut -d / -f 5 | xargs stow
    fi
done

