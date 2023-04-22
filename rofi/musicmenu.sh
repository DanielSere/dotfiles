#!/bin/bash

ROFI() {
	CURRENT=$(mpc current)
	CURRENTTIME=$(mpc status "\[%currenttime%-%totaltime%\]")
	CONFIG="#entry {text-color: @background-color;}"
	[ -z "$CURRENT" ] && CURRENT="MPD isn't playing anything right now"
	rofi -theme-str "$CONFIG" -dmenu -i -p "$CURRENTTIME  $CURRENT" $1
}

cur_pos() {	$(mpc  | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}') ; }
end_pos() { $(mpc playlist | wc -l) ; }

add_after_current(){
	if [ "$(mpc playlist | wc -l)" == "0" ]; then
		mpc add "$1" 
	elif [ -z "$(mpc current)" ]; then 
		mpc play
		mpc add "$1"
		mpc move $(( end_pos +1)) $(( cur_pos +1))
		mpc stop
	else
		mpc add "$1"
		mpc move $(( end_pos +1)) $(( cur_pos +1))
	fi
}
add_after_current_and_play(){
	if [ "$(mpc playlist | wc -l)" == "0" ]; then
		mpc add "$1" 
		mpc play
	elif [ -z "$(mpc current)" ]; then 
		mpc play
		mpc add "$1"
		mpc move $(( end_pos +1)) $(( cur_pos +1))
		mpc play $(( cur_pos +1))
	else
		mpc add "$1"
		mpc move $(( end_pos +1)) $(( cur_pos +1))
		mpc play $(( cur_pos +1))
	fi
}

queued() {
	OPTION=$(echo -e "Clear\n$(mpc playlist)" | ROFI "-u '0'");
	TITLE=$(mpc playlist | grep -n "$OPTION" | awk -F: '{print $1}')
	[ "$OPTION" == "Clear" ] && mpc clear
	[ -n "$OPTION" ] && mpc play "$TITLE" || return
	queued
}

track() {
	OPTION=$(mpc list title | sort -f | ROFI)
	TITLE=$(mpc find title "$OPTION" | head -1)
	[ -n "$OPTION" ] && add_after_current_and_play "$TITLE" || return
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
	while true; do
		ARTIST="$(mpc list artist | sort -f | ROFI)";
		[ "$ARTIST" = "" ] && return
		while true; do
			TITLES=$(mpc list title artist "$ARTIST")
			TITLE=$(echo -e "Add all\nReplace all\n$TITLES" | ROFI "-u '0,1'");
			case $TITLE in
				"Replace all")
					mpc clear; mpc find artist "$ARTIST" | mpc add
					[ -n "$(mpc current)" ] && mpc play || break;;
				"Add all")
					mpc find artist "$ARTIST" | mpc add; break;;
				"") break;;
			esac
			while true; do
				DEC=$(echo -e "Add after current and play\nAdd after current\nAdd at the end\nReplace" | ROFI "-u ':");
				case $DEC in 
					"Add after current and play")
						add_after_current_and_play "$(mpc find artist "$ARTIST" title "$TITLE" | head -1 )";;
					"Add after current")
						add_after_current "$(mpc find artist "$ARTIST" title "$TITLE" | head -1 )";;
					"Add at the end")
						mpc find artist "$ARTIST" title "$TITLE" | head -1 | mpc add;;
					"Replace")
						mpc clear; mpc find artist "$ARTIST" title "$TITLE" | head -1 | mpc add
						[ -n "$(mpc current)" ] && mpc play;;
					"") break;;
				esac
				break
			done
		done
	done
}

MENU() {
	menu="Stop\nQueued\nArtist\nTrack"
	[ -z "$(mpc | grep playing)" ] && menu="Play\n$menu" || menu="Pause\n$menu"
	echo -e $menu
}

main() {
	case $(MENU | ROFI "-u '0,1'") in
		"Play"    ) mpc toggle; main;;
		"Pause"   ) mpc toggle; main;;
		"Stop"    ) mpc stop; main;;
		"Queued"  ) queued; main;;
		"Artist"  ) artist; main;;
		"Track"   ) track; main;;
		"Playlist") playlist; main;;
		*) ;;
	esac
}

main
