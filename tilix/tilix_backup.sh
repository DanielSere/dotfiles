#!/usr/bin/env bash

# Backs up and restores tilix settings 

set -e
if [[ $1 == '-h' ]]; then
	echo ''
	echo ' -b    backup tilix config to ~/.config/tilix/tilix-settings.dconf'
	echo ' -r    restore tilix config from ~/.config/tilix/tilix-settings.dconf'
	echo ' -h    to show this message'
	exit 0
fi
if [[ $1 == '-b' ]]; then
  dconf dump '/com/gexperts/Tilix/' > ~/.config/tilix/tilix-settings.dconf
  echo "backup done"
  exit 0
fi
if [[ $1 == '-r' ]]; then
  dconf load '/com/gexperts/Tilix/' < ~/.config/tilix/tilix-settings.dconf
  echo "restore done"
  exit 0
fi
