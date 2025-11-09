#!/bin/bash

# Terminate already running compton/picom instances
killall -q picom

# Wait for the processes to exit
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done

# Launch picom with your preferred configuration
picom -b --config ~/.config/picom/picom.conf
