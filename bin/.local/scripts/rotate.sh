#!/bin/bash

# Get the current transform value for DSI-1
current_transform=$(hyprctl monitors | awk '/DSI-1/ {flag=1; next} /transform:/ {print $2; exit}')

# Toggle between landscape and portrait
if [ "$current_transform" == "0" ]; then
    # Currently portrait, switch to landscape
    hyprctl keyword monitor "DSI-1, 1200x1920,auto,1.5,transform,3"
    hyprctl keyword input:touchdevice:transform 3
    echo "Switched to landscape mode"
else
    # Currently landscape, switch to portrait
    hyprctl keyword monitor "DSI-1, 1200x1920,auto,1.5,transform,0"
    hyprctl keyword input:touchdevice:transform 0
    echo "Switched to portrait mode"
fi
