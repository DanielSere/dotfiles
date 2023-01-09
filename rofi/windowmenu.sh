#!/bin/bash

MENU="Lock\nSuspend\nLogout\nReboot\nShutdown"

case "$(echo -e $MENU | rofi -dmenu -p 'Power Menu')" in 
	Suspend)  loginctl suspend ;;
	Lock)     lock.sh ;;
	Logout)   logout.sh ;;
	Reboot)   loginctl reboot ;;
	Shutdown) loginctl poweroff ;;
esac

WINDOW STATES
       tiled
           Its size and position are determined by the window tree.

       pseudo_tiled
           A tiled window that automatically shrinks but doesn’t stretch
           beyond its floating size.

       floating
           Can be moved/resized freely. Although it doesn’t use any tiling
           space, it is still part of the window tree.

       fullscreen
           Fills its monitor rectangle and has no borders.
