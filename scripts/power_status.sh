#!/bin/sh
i3status | while read -r line
do
    profile=$(powerprofilesctl get 2>/dev/null || echo "off")
    echo "PPD: $profile | $line" || exit 1
done
