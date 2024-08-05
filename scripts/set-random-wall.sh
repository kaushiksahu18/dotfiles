#!/bin/bash
# Directory containing wallpapers

WALLPAPER_DIR="$HOME/dotfiles/walls"

# Set default wallpaper category
walls="mix" # OR gils
# Override default if argument is provided
if [ -n "$1" ]; then
    walls="$1"
fi

# Select a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR/$walls" -type f | shuf -n 1)

# Apply the wallpaper
qdbus6 org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
var allDesktops = desktops();
for (i=0;i<allDesktops.length;i++) {
    d = allDesktops[i];
    d.wallpaperPlugin = 'org.kde.image';
    d.currentConfigGroup = Array('Wallpaper', 'org.kde.image', 'General');
    d.writeConfig('Image', 'file://$WALLPAPER')
}"
