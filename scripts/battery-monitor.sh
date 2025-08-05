#!/bin/bash

while true; do
    battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ "$battery_level" -le 15 ]; then
        notify-send "battery low : Plugin Charger"
    fi
    sleep 60
done
