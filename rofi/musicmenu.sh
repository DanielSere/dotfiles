#!/bin/bash

ROFI() {
	CURRENT=$(mpc current)
	CURRENTTIME=$(mpc status "\[%currenttime%-%totaltime%\]")
	if [[ -z "$CURRENT" ]]; then
		CURRENT="MPD isn't playing anything right now"
	fi
	rofi -theme-str "#entry { text-color: @background-color; }" -dmenu -p "$CURRENTTIME  $CURRENT"
}
#when set to exit, mpd_control will exit if you press escape
#when set to break, mpd_control will go the upper level if possible
ESC_ACTION="break"
SERVER=6600
MENU="Queued\nArtist\nAlbum\nTrack\nPlaylist"

addaftercurrent(){
	#playlist is empty, just add the song
	if [ "$(mpc -p $SERVER playlist | wc -l)" == "0" ]; then
		mpc -p $SERVER add "$1" 
	#there is no current song so mpd is stopped
	#it seems to be impossible to determine the current songs' position when 
	#mpd is stopped, so just add to the end
	elif [ -z "$(mpc -p $SERVER current)" ]; then 
		mpc -p $SERVER play
		CUR_POS=$(mpc -p $SERVER  | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}')
		END_POS=$(mpc -p $SERVER playlist | wc -l)
		mpc -p $SERVER add "$1"
		mpc -p $SERVER move $(($END_POS+1)) $(($CUR_POS+1))	
		mpc -p $SERVER stop
	#at least 1 song is in the playlist, determine the position of the 
	#currently played song and add $1 after it
	else
		CUR_POS=$(mpc -p $SERVER  | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}')
		END_POS=$(mpc -p $SERVER playlist | wc -l)
		mpc -p $SERVER add "$1"
		mpc -p $SERVER move $(($END_POS+1)) $(($CUR_POS+1))	
	fi
}
addaftercurrentandplay(){
	#playlist is empty, just add the song
	if [ "$(mpc -p $SERVER playlist | wc -l)" == "0" ]; then
		mpc -p $SERVER add "$1" 
		mpc -p $SERVER play
	#there is no current song so mpd is stopped
	#it seems to be impossible to determine the current songs' position when 
	#mpd is stopped, so just add to the end
	elif [ -z "$(mpc -p $SERVER current)" ]; then 
		mpc -p $SERVER play
		CUR_POS=$(mpc -p $SERVER  | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}')
		END_POS=$(mpc -p $SERVER playlist | wc -l)
		mpc -p $SERVER add "$1"
		mpc -p $SERVER move $(($END_POS+1)) $(($CUR_POS+1))	
		mpc -p $SERVER play $(($CUR_POS+1))
	#at least 1 song is in the playlist, determine the position of the 
	#currently played song and add $1 after it
	else
		CUR_POS=$(mpc -p $SERVER | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}')
		END_POS=$(mpc -p $SERVER playlist | wc -l)
		mpc -p $SERVER add "$1"
		mpc -p $SERVER move $(($END_POS+1)) $(($CUR_POS+1))	
		mpc -p $SERVER play $(($CUR_POS+1))
	fi
}

case "$(echo -e $MENU | ROFI)" in
	"Queued")
		TITLE=$(mpc -p $SERVER playlist | ROFI);
		if [ "$TITLE" = "" ]; then exit; fi
		POS=$(mpc -p $SERVER playlist | grep -n "$TITLE" | awk -F: '{print $1}')
		mpc -p $SERVER play $POS;
	;;

	"Artist")
		while true; do
			ARTIST="$(mpc -p $SERVER list artist | sort -f | ROFI)";
			if [ "$ARTIST" = "" ]; then $ESC_ACTION; fi
			while true; do
				ALBUMS=$(mpc -p $SERVER list album artist "$ARTIST" | sort -f);
				ALBUM=$(echo -e "Replace all\nAdd all\n----------------------------------------------------------\n$ALBUMS" | ROFI);
				if [ "$ALBUM" = "" ]; then $ESC_ACTION;
				elif [ "$ALBUM" = "Replace all" ]; then
					CUR_SONG=$(mpc -p $SERVER current)
					mpc -p $SERVER clear
					mpc -p $SERVER find artist "$ARTIST" | mpc -p $SERVER add 
					if [ -n "$CUR_SONG" ]; then mpc -p $SERVER  play; fi
					$ESC_ACTION
				elif [ "$ALBUM" = "Add all" ]; then 
					mpc -p $SERVER find artist "$ARTIST" | mpc -p $SERVER add
					$ESC_ACTION
				fi
				while true; do		
					TITLES=$(mpc -p $SERVER list title artist "$ARTIST" album "$ALBUM")
					TITLE=$(echo -e "Replace all\nAdd all\n----------------------------------------------------------\n$TITLES" | ROFI);
					if [ "$TITLE" = "" ]; then $ESC_ACTION
					elif [ "$TITLE" = "Replace all" ]; then
						CUR_SONG=$(mpc -p $SERVER current)
						mpc -p $SERVER clear;
						mpc -p $SERVER find artist "$ARTIST" album "$ALBUM" | mpc -p $SERVER add 
						if [ -n "$CUR_SONG" ]; then mpc -p $SERVER play; fi
						$ESC_ACTION
					elif [ "$TITLE" = "Add all" ]; then
						mpc -p $SERVER find artist "$ARTIST" album "$ALBUM" | mpc -p $SERVER add 
						$ESC_ACTION
					fi
					while true; do
						DEC=$(echo -e "Add after current and play\nAdd after current\nAdd at the end\nReplace" | ROFI);
						case $DEC in 
							"")
							$ESC_ACTION
							;;
							"Add after current and play")
							addaftercurrentandplay "$(mpc -p $SERVER find artist "$ARTIST" album "$ALBUM" title "$TITLE" | head -1 )"
							;;
							"Add after current")
							addaftercurrent "$(mpc -p $SERVER find artist "$ARTIST" album "$ALBUM" title "$TITLE" | head -1 )"
							;;
							"Replace")
							CUR_SONG=$(mpc -p $SERVER current)
							mpc -p $SERVER clear
							mpc -p $SERVER find artist "$ARTIST" album "$ALBUM" title "$TITLE" | head -1 | mpc -p $SERVER add
							if [ -n "$CUR_SONG" ]; then mpc -p $SERVER play; fi
							;;
							"Add at the end")
							mpc -p $SERVER find artist "$ARTIST" album "$ALBUM" title "$TITLE" | head -1 | mpc -p $SERVER add
							;;
						esac
						$ESC_ACTION
					done
				done
			done
		done
	;;

	"Album")
		while true; do
			ALBUM=$(mpc -p $SERVER list album | sort -f | ROFI);
			if [ "$ALBUM" = "" ]; then $ESC_ACTION;
			fi
			while true; do		
				TITLES=$(mpc -p $SERVER list title album "$ALBUM")
				TITLE=$(echo -e "Replace all\nAdd all\n----------------------------------------------------------\n$TITLES" | ROFI);
				if [ "$TITLE" = "" ]; then $ESC_ACTION
				elif [ "$TITLE" = "Replace all" ]; then
					CUR_SONG=$(mpc -p $SERVER current)
					mpc -p $SERVER clear;
					mpc -p $SERVER find album "$ALBUM" | mpc -p $SERVER add 
					if [ -n "$CUR_SONG" ]; then mpc -p $SERVER play; fi
					$ESC_ACTION
				elif [ "$TITLE" = "Add all" ]; then
					mpc -p $SERVER find album "$ALBUM" | mpc -p $SERVER add 
					$ESC_ACTION
				fi
				while true; do
					DEC=$(echo -e "Add after current and play\nAdd after current\nAdd at the end\nReplace" | ROFI);
					case $DEC in 
						"")
						$ESC_ACTION
						;;
						"Add after current and play")
						addaftercurrentandplay "$(mpc -p $SERVER find album "$ALBUM" title "$TITLE" | head -1 )"
						;;
						"Add after current")
						addaftercurrent "$(mpc -p $SERVER find album "$ALBUM" title "$TITLE" | head -1 )"
						;;
						"Replace")
						CUR_SONG=$(mpc -p $SERVER current)
						mpc -p $SERVER clear
						mpc -p $SERVER find album "$ALBUM" title "$TITLE" | head -1 | mpc -p $SERVER add
						if [ -n "$CUR_SONG" ]; then mpc -p $SERVER play; fi
						;;
						"Add at the end")
						mpc -p $SERVER find album "$ALBUM" title "$TITLE" | head -1 | mpc -p $SERVER add
						;;
					esac
					$ESC_ACTION
				done
			done
		done
	;;

	"Track")
		TITLE=$(mpc -p $SERVER list title | sort -f | ROFI)
		if [ "$TITLE" = "" ]; then exit; fi
		SONG=$(mpc -p $SERVER find title "$TITLE" | head -1) 
		addaftercurrentandplay "$SONG"
	;;

	"Playlist")
		PLAYLIST=$(mpc -p $SERVER lsplaylists | ROFI);
		if [ "$PLAYLIST" = "" ]; then exit; fi
		CUR_SONG=$(mpc -p $SERVER current)
		mpc -p $SERVER clear
		mpc -p $SERVER load "$PLAYLIST";
		if [ -n "$CUR_SONG" ]; then mpc -p $SERVER play; fi
	;;

	*) 
	;;
esac
