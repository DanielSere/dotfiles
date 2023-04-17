#!/bin/bash

MENU="Tiled\nWide Up\nWide Down\nTall\nGrid"

case "$(echo -e $MENU | rofi -dmenu -p 'Layout Menu:')" in
	"Tiled") bsp-layout set tiled;;
	"Wide Up") bsp-layout set wide;;
	"Wide Down") bsp-layout set rwide;;
	"Tall") bsp-layout set tall;;
	"Grid") bsp-layout set rgrid;;
esac
