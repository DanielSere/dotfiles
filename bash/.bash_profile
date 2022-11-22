# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export PATH=$PATH:$HOME/.bin

export XDG_RUNTIME_DIR=/run/user/$UID
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc

export HISTFILE=$XDG_STATE_HOME/bash/history
export PULSE_RUNTIME_PATH=$XDG_RUNTIME_DIR/pulse/
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
#export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
#export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
#export $(dbus-launch)



# Start X
#estartx
