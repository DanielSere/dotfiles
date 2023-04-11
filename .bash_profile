#!/bin/bash

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

#########
## XDG ##
#########
export XDG_RUNTIME_DIR=/run/user/$UID
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DOWNLOAD_DIR=$HOME/Downloads
export XDG_DOCUMENTS_DIR=$HOME/Documents
export XDG_PICTURES_DIR=$HOME/Pictures
export XDG_VIDEOS_DIR=$HOME/Videos
export XDG_MUSIC_DIR=$HOME/Music
export XCURSOR_PATH=$XDG_DATA_HOME/icons:/usr/share/icons

##########
## Xorg ##
##########
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export XINITRC=$XDG_CONFIG_HOME/x11/xinitrc

##########
## Apps ##
##########
export EDITOR='nvim'
export TERMINAL='tilix'
export BROWSER='librewolf'

##########
## Rust ##
##########
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

################
## Some stuff ##
################
export HISTFILE=$XDG_STATE_HOME/bash/history
export PULSE_RUNTIME_PATH=$XDG_RUNTIME_DIR/pulse/
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
export LESSHISTFILE=$XDG_STATE_HOME/less/history
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export PYTHONSTARTUP=/etc/python/pythonrc
export LF_ICONS="$(tr '\n' ':' <~/.config/lf/icons)"
export COLORTEMP='0'

##########
## Path ##
##########
export PATH="$HOME/.local/bin:$CARGO_HOME/bin:$PATH"

#############
## Start X ##
#############
clear ; startx -x $XINITRC -- vt1 &> /dev/null


