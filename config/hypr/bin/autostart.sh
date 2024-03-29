########################################################################################

#     __  __                     __ __  _  __   __            ___      ____ 
#    / / / /__  __ ____   _____ / //_/ (_)/ /_ / /_ __  __   |__ \    / __ \
#   / /_/ // / / // __ \ / ___// ,<   / // __// __// / / /   __/ /   / / / /
#  / __  // /_/ // /_/ // /   / /| | / // /_ / /_ / /_/ /   / __/ _ / /_/ / 
# /_/ /_/ \__, // .___//_/   /_/ |_|/_/ \__/ \__/ \__, /   /____/(_)\____/  
#        /____//_/                               /____/                     

########################################################################################

#!/usr/bin/env bash

## Autostart Programs

# Kill already running process
_ps=(waybar hyprpaper polkit-gnome-authentication-agent-1)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Waybar
waybar &

# Hyprpaper
hyprpaper &

# Gnome Polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &