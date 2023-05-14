#!/bin/bash

MENU="Fullscreen\nTiled\nPseudoTiled\nFloating\nMonocle"

case "$(echo -e $MENU | rofi -dmenu -p 'Window Mode:')" in 
	Fullscreen)  bspc node --state ~fullscreen ;;
	Tiled)       bspc node --state ~tiled ;;
	PseudoTiled) bspc node --state ~pseudo_tiled ;;
	Floating)    bspc node --state ~floating ;;
	Monocle)     bspc desktop --layout next ;;
esac
