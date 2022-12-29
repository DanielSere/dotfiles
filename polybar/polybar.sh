#!/bin/bash

# Polybar configs directory
DIR="$HOME/.config/polybar"

# Terminate already running bar instances
pkill polybar

# Wait while the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null
	do sleep 1
done

# Launch the bar
polybar -q main -c /home/kino/.config/polybar/config.ini &
