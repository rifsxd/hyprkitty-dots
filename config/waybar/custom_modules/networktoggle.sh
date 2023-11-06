########################################################################################

#     __  __                     __ __  _  __   __            ___      ____ 
#    / / / /__  __ ____   _____ / //_/ (_)/ /_ / /_ __  __   |__ \    / __ \
#   / /_/ // / / // __ \ / ___// ,<   / // __// __// / / /   __/ /   / / / /
#  / __  // /_/ // /_/ // /   / /| | / // /_ / /_ / /_/ /   / __/ _ / /_/ / 
# /_/ /_/ \__, // .___//_/   /_/ |_|/_/ \__/ \__/ \__, /   /____/(_)\____/  
#        /____//_/                               /____/                     

########################################################################################

#!/bin/bash

# Check if the connection is enabled or disabled

device=$(ls /sys/class/net | grep -E '^enp[0-9]+s[0-9]+$')

status=$(nmcli dev show $device | grep -E '^GENERAL.STATE' | awk '{print $2}')

if [ "$status" == "100" ]; then
    # If enabled, disconnect
    nmcli dev disconnect $(ls /sys/class/net | grep -E '^enp[0-9]+s[0-9]+$')
    echo "Network disconnected."
elif [ "$status" == "30" ]; then
    # If disabled, connect
    nmcli dev connect $(ls /sys/class/net | grep -E '^enp[0-9]+s[0-9]+$')
    echo "Network connected."
else
    # If in another state, display a message
    echo "Network is in an unknown state."
fi

