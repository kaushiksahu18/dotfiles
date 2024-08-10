#!/bin/bash

# Path to the configuration file
CONFIG_FILE="$HOME/.config/kwinrulesrc"

# Rule ID for the blur effect
RULE_ID="de528987-3a09-49b8-a877-aa3da4574e9b"

# Check the current opacity value
if grep -q "opacityactive=79" "$CONFIG_FILE"; then
    # Change opacity from 79 to 100
    sed -i "s/opacityactive=79/opacityactive=100/" "$CONFIG_FILE"
else
    # Change opacity from 100 to 79
    sed -i "s/opacityactive=100/opacityactive=79/" "$CONFIG_FILE"
fi

# Apply changes
qdbus6 org.kde.KWin /KWin reconfigure
