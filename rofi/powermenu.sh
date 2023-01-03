#!/bin/bash

MENU="Shutdown\nReboot\nLogout"

DIALOG_RESULT=$(echo -e $MENU | rofi -dmenu -p "Power Menu")

[ "$DIALOG_RESULT" = "Reboot" ]   && sudo reboot
[ "$DIALOG_RESULT" = "Logout" ]   && ((sleep 1; pkill -KILL -u kino) & bspc quit)
[ "$DIALOG_RESULT" = "Shutdown" ] && sudo poweroff
