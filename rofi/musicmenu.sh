#!/bin/bash

ROFI() {
	CURRENT=$(mpc current | sed -e 's/&/and/g')
	CURRENTTIME=$(mpc status "\[%currenttime%-%totaltime%\]")
	CONFIG='#mainbox { children: [inputbar,message,listview,mode-switcher]; }'
	[ -z "$CURRENT" ] && CURRENT="MPD isn't playing anything right now"
	rofi -theme-str "$CONFIG" -dmenu -i -p "Search:" -mesg "$CURRENTTIME $CURRENT" $1
}

queued() {
	OPTION=$(echo -e "Clear\n$(mpc playlist)" | ROFI " -u '0' ");
	TITLE=$(mpc playlist | grep -n "$OPTION" | awk -F: '{print $1}')
	[ "$OPTION" == "Clear" ] && mpc clear
	[ -n "$OPTION" ] && mpc play "$TITLE" || return
	queued
}

track() {
	OPTION=$(mpc listall | sed 's/....$//g' | sort -f | ROFI)
	TITLE=$(mpc search filename "$OPTION" | head -1)
	[ -n "$OPTION" ] && (mpc insert "$TITLE"; mpc next; mpc play) || return
	track
}

playlist() {
	PLAYLIST=$(mpc lsplaylists | ROFI);
	[ -z "$PLAYLIST" ] && return
	CUR_SONG=$(mpc current)
	mpc clear
	mpc load "$PLAYLIST";
	[ -n "$CUR_SONG" ] && mpc play
	playlist
}

artist() {
	ARTIST="$(mpc list artist | sort -f | ROFI)";
	[ -z "$ARTIST" ] && return
	TITLES=$(mpc list title artist "$ARTIST")
	TITLE=$(echo -e "Add all\nReplace all\n$TITLES" | ROFI " -u '0,1' ")
	case $TITLE in
		"Replace all") mpc clear; mpc find artist "$ARTIST" | mpc add; mpc play; return;;
		"Add all") mpc find artist "$ARTIST" | mpc add; return;;
		"") artist;;
		*) mpc find artist "$ARTIST" title "$TITLE" | mpc insert; mpc next; mpc play; return;;
	esac
}

MENU() {
	MENU="Stop\nQueued\nArtist\nTracks"
	[ -z "$(mpc | grep playing)" ] && MENU="Play\n$MENU" || MENU="Pause\n$MENU"
	echo -e $MENU
}

MAIN() {
	case $(MENU | ROFI " -u '0,1' ") in
		"Play"    ) mpc toggle; MAIN;;
		"Pause"   ) mpc toggle; MAIN;;
		"Stop"    ) mpc stop; MAIN;;
		"Queued"  ) queued; MAIN;;
		"Artist"  ) artist; MAIN;;
		"Tracks"   ) track; MAIN;;
		"Playlist") playlist; MAIN;;
		*) ;;
	esac
}

MAIN
