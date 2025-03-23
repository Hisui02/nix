#!/bin/sh

MONITOR="eDP-1"
CONNECTED_MONITORS=$(hyprctl monitors | grep -c "Monitor")

if [ "$CONNECTED_MONITORS" -gt 1 ] && hyprctl monitors | grep -q "$MONITOR"; then
    hyprctl keyword monitor eDP-1, disable
else
    hyprctl keyword monitor eDP-1, highres@highrr, auto, 1.2
fi
