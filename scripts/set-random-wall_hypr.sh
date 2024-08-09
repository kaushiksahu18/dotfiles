#!/bin/bash

# Define directory containing wallpapers
directory=~/dotfiles/walls/
monitor=$(hyprctl monitors | grep Monitor | awk '{print $2}')

# Set default wallpaper category
walls="nature"
# Override default if argument is provided
if [ -n "$1" ]; then
    walls="$1"
fi

# Check if the wallpaper directory exists
if [ -d "$directory" ]; then
    # Select a random wallpaper from the specified category
    random_background=$(find "$directory/$walls" -type f | shuf -n 1)

    # Apply the selected wallpaper
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$random_background"
    hyprctl hyprpaper wallpaper "$monitor, $random_background"
fi
