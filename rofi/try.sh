#!/bin/bash

ROFI() {
	CURRENT=$(mpc current)
	CURRENTTIME=$(mpc status "\[%currenttime%-%totaltime%\]")
	[ -z "$CURRENT" ] && CURRENT="MPD isn't playing anything right now"
	rofi -theme-str "#entry { text-color: @background-color; }" -dmenu -p "$CURRENTTIME  $CURRENT"
}
#when set to exit, mpd_control will exit if you press escape
#when set to break, mpd_control will go the upper level if possible
ESC_ACTION="break"

addaftercurrent(){
	#playlist is empty, just add the song
	if [ "$(mpc playlist | wc -l)" == "0" ]; then
		mpc add "$1" 
	#there is no current song so mpd is stopped
	#it seems to be impossible to determine the current songs' position when 
	#mpd is stopped, so just add to the end
	elif [ -z "$(mpc current)" ]; then 
		mpc play
		CUR_POS=$(mpc  | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}')
		END_POS=$(mpc playlist | wc -l)
		mpc add "$1"
		mpc move $(($END_POS+1)) $(($CUR_POS+1))	
		mpc stop
	#at least 1 song is in the playlist, determine the position of the 
	#currently played song and add $1 after it
	else
		CUR_POS=$(mpc  | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}')
		END_POS=$(mpc playlist | wc -l)
		mpc add "$1"
		mpc move $(($END_POS+1)) $(($CUR_POS+1))	
	fi
}
addaftercurrentandplay(){
	#playlist is empty, just add the song
	if [ "$(mpc playlist | wc -l)" == "0" ]; then
		mpc add "$1" 
		mpc play
	#there is no current song so mpd is stopped
	#it seems to be impossible to determine the current songs' position when 
	#mpd is stopped, so just add to the end
	elif [ -z "$(mpc current)" ]; then 
		mpc play
		CUR_POS=$(mpc  | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}')
		END_POS=$(mpc playlist | wc -l)
		mpc add "$1"
		mpc move $(($END_POS+1)) $(($CUR_POS+1))	
		mpc play $(($CUR_POS+1))
	#at least 1 song is in the playlist, determine the position of the 
	#currently played song and add $1 after it
	else
		CUR_POS=$(mpc | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}')
		END_POS=$(mpc playlist | wc -l)
		mpc add "$1"
		mpc move $(($END_POS+1)) $(($CUR_POS+1))	
		mpc play $(($CUR_POS+1))
	fi
}

queued() {
	TITLE=$(mpc playlist | ROFI);
	[ -z "$TITLE" ] && exit
	POS=$(mpc playlist | grep -n "$TITLE" | awk -F: '{print $1}')
	mpc play $POS;
}

artist() {
	while true; do
		ARTIST="$(mpc list artist | sort -f | ROFI)";
		if [ "$ARTIST" = "" ]; then $ESC_ACTION; fi
		while true; do
			ALBUMS=$(mpc list album artist "$ARTIST" | sort -f);
			ALBUM=$(echo -e "Replace all\nAdd all\n----------------------------------------------------------\n$ALBUMS" | ROFI);
			if [ "$ALBUM" = "" ]; then $ESC_ACTION;
			elif [ "$ALBUM" = "Replace all" ]; then
				CUR_SONG=$(mpc current)
				mpc clear
				mpc find artist "$ARTIST" | mpc add 
				if [ -n "$CUR_SONG" ]; then mpc  play; fi
				$ESC_ACTION
			elif [ "$ALBUM" = "Add all" ]; then 
				mpc find artist "$ARTIST" | mpc add
				$ESC_ACTION
			fi
			while true; do		
				TITLES=$(mpc list title artist "$ARTIST" album "$ALBUM")
				TITLE=$(echo -e "Replace all\nAdd all\n----------------------------------------------------------\n$TITLES" | ROFI);
				if [ "$TITLE" = "" ]; then $ESC_ACTION
				elif [ "$TITLE" = "Replace all" ]; then
					CUR_SONG=$(mpc current)
					mpc clear;
					mpc find artist "$ARTIST" album "$ALBUM" | mpc add 
					if [ -n "$CUR_SONG" ]; then mpc play; fi
					$ESC_ACTION
				elif [ "$TITLE" = "Add all" ]; then
					mpc find artist "$ARTIST" album "$ALBUM" | mpc add 
					$ESC_ACTION
				fi
				while true; do
					DEC=$(echo -e "Add after current and play\nAdd after current\nAdd at the end\nReplace" | ROFI);
					case $DEC in 
						"")
						$ESC_ACTION
						;;
						"Add after current and play")
						addaftercurrentandplay "$(mpc find artist "$ARTIST" album "$ALBUM" title "$TITLE" | head -1 )"
						;;
						"Add after current")
						addaftercurrent "$(mpc find artist "$ARTIST" album "$ALBUM" title "$TITLE" | head -1 )"
						;;
						"Replace")
						CUR_SONG=$(mpc current)
						mpc clear
						mpc find artist "$ARTIST" album "$ALBUM" title "$TITLE" | head -1 | mpc add
						if [ -n "$CUR_SONG" ]; then mpc play; fi
						;;
						"Add at the end")
						mpc find artist "$ARTIST" album "$ALBUM" title "$TITLE" | head -1 | mpc add
						;;
					esac
					$ESC_ACTION
				done
			done
		done
	done
}

track() {
	TITLE=$(mpc list title | sort -f | ROFI)
	[ -z "$TITLE" ] && exit
	SONG=$(mpc find title "$TITLE" | head -1) 
	addaftercurrentandplay "$SONG"
}

playlist() {
	PLAYLIST=$(mpc lsplaylists | ROFI);
	[ -z "$PLAYLIST" ] && exit
	CUR_SONG=$(mpc current)
	mpc clear
	mpc load "$PLAYLIST";
	[ -n "$CUR_SONG" ] && mpc play
}

# MENU="Queued\nArtist\nTrack\nPlaylist"

# case "$(echo -e $MENU | ROFI)" in
case $1 in
	"Queued"  ) queued ;;
	"Artist"  ) artist ;;
	"Track"   ) track ;;
	"Playlist") playlist ;;
	*) ;;
esac
