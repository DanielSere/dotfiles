#!/bin/bash

BSSID=$(nmcli --fields "IN-USE,BSSID,SSID"  device wifi list | sed 1d| rofi -dmenu -p "Run: ")
echo $BSSID > ~/Documents/filename
