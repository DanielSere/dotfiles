#!/bin/bash

MENU="Lock\nSuspend\nLogout\nReboot\nShutdown"

case "$(echo -e $MENU | rofi -dmenu -p 'Power Menu')" in 
	Suspend)  loginctl suspend ;;
	Lock)     lock.sh ;;
	Logout)   logout.sh ;;
	Reboot)   loginctl reboot ;;
	Shutdown) loginctl poweroff ;;
esac
