#!/usr/bin/env bash

## Autostart Programs

# Kill already running process
_ps=(waybar hyprpaper)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Waybar
waybar &

# Hyprpaper
hyprpaper &
