#!/bin/bash

# Path to the configuration file
CONFIG_FILE="$HOME/.config/kwinrulesrc"

# Rule ID for the blur effect
RULE_ID="de528987-3a09-49b8-a877-aa3da4574e9b"

# Function to get the current opacity value
get_current_opacity() {
    grep -Po "(?<=opacityactive=)[0-9]+" "$CONFIG_FILE"
}

# Function to set the opacity value
set_opacity() {
    local NEW_OPACITY="$1"
    sed -i "s/opacityactive=[0-9]*/opacityactive=$NEW_OPACITY/" "$CONFIG_FILE"
    
    # Check if sed was successful
    if [ $? -ne 0 ]; then
        echo "Error: Failed to update the opacity value in the configuration file."
        exit 1
    fi

    # Apply changes
    qdbus6 org.kde.KWin /KWin reconfigure

    # Check if qdbus6 was successful
    if [ $? -ne 0 ]; then
        echo "Error: Failed to reconfigure KWin."
        exit 1
    fi
}

# Main script logic
if [ -z "$1" ]; then
    # No argument provided, check current opacity
    CURRENT_OPACITY=$(get_current_opacity)

    if [ "$CURRENT_OPACITY" -eq 100 ]; then
        set_opacity 80
    elif [ "$CURRENT_OPACITY" -lt 100 ]; then
        set_opacity 100
    else
        echo "Error: Current opacity value is not 80 or 100. Provide an explicit value between 50 and 100."
        exit 1
    fi
else
    # Validate and use the provided argument
    if ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -lt 50 ] || [ "$1" -gt 100 ]; then
        echo "Error: Invalid opacity value. It should be an integer between 50 and 100."
        exit 1
    fi

    set_opacity "$1"
fi
