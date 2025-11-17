#!/bin/bash

while true; do
    plugin_status=$(cat /sys/class/power_supply/AC/online)

    if [[ "${plugin_status}" == "0" ]]; then
        battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
        if [ "$battery_level" -le 15 ]; then
            notify-send "battery low : Plugin Charger"
        fi
    fi

    sleep 60
done
