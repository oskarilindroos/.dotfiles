#!/bin/bash

# Check if gammastep is running
if pgrep -x "gammastep" > /dev/null; then
    # If gammastep is running, kill it to turn off Night Light
    pkill gammastep
    echo '{"text": "Night Light: Off", "class": "off"}'
else
    # If gammastep is not running, start it with the desired temperature
    gammastep -P -O 2000 &
    echo '{"text": "Night Light: On", "class": "on"}'
fi
