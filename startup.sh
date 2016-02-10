#!/bin/bash

cd ~/dotfiles
for folder in ~/dotfiles/*; do
    if [ -f $folder ]; then
        echo "$folder is a file, skipping."
    else
        echo "$folder" | cut -d / -f 5 | xargs stow
    fi
done

