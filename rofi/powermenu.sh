#!/bin/bash

MENU="Lock\nSuspend\nLogout\nReboot\nShutdown"

case "$(echo -e $MENU | rofi -dmenu -p 'Power Menu:')" in 
	"Suspend")  loginctl suspend ;;
	"Reboot")   loginctl reboot ;;
	"Shutdown") loginctl poweroff ;;
	"Logout")   (( sleep 0.5; loginctl kill-user kino ) & bspc quit );;
	"Lock")     `xset s 300 300; i3lock -ne --line-color=00000000 --keyhl-color=00000000 \
			   --bshl-color=00000000 --separator-color=00000000 --radius=250 --insidever-color=00000000\
			   --insidewrong-color=00000000 --inside-color=00000000 --ring-color=88c0d0\
			   --ringver-color=609d87 --ringwrong-color=b75154 --clock --time-str="%I:%M:%S"\
			   --time-color=ffffff --time-size=100 --date-color=ffffff --date-str="%A, %d %B"\
			   --date-size=30 --date-pos="tx:775" --verif-text="Verifying..." --verif-color=609d87\
			   --verif-size=50 --wrong-text="Incorrect" --wrong-color=b75154 --wrong-size=50\
			   --indicator --color=2e3440 --noinput-text="No Input"; xset s 0 0`;;
esac
