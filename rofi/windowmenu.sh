#!/bin/bash

MENU="Fullscreen\nFloating\nTiled"

case "$(echo -e $MENU | rofi -dmenu -p 'Window Mode:')" in 
	Fullscreen)  bspc node --state ~fullscreen ;;
	Floating)    bspc node --state ~floating ;;
	Tiled)       bspc node --state ~tiled ;;
esac
