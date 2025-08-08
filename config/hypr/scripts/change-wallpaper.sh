#!/bin/bash

# Kill existing swaybg instances so wallpapers don't stack
pkill swaybg

# Define monitor names (adjust if needed)
OUTPUT1="DP-1"
OUTPUT2="HDMI-A-1"

# Get current hour (24h format)
hour=$(date +%H)

# Change wallpapers depending on time
if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
    # Day wallpapers
    swaybg -o "$OUTPUT1" -i ~/.config/wallpapers/day1.jpg -m fill &
    swaybg -o "$OUTPUT2" -i ~/.config/wallpapers/day2.jpg -m fill &
else
    # Night wallpapers
    swaybg -o "$OUTPUT1" -i ~/.config/wallpapers/night1.jpg -m fill &
    swaybg -o "$OUTPUT2" -i ~/.config/wallpapers/night2.jpg -m fill &
fi
