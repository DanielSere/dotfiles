#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set up starship
eval "$(starship init bash)"

###########
## Alias ##
###########

# Basics
alias l='lsd -AlL --group-dirs=last --date=+"%d/%m/%y - %H:%M:%S"'
alias cl='clear'
alias rm='rm -rf'
alias xx='exit'
alias ..='cd ..'

# XBPS
alias iii='sudo xbps-install -Sv'
alias uuu='sudo xbps-install -Suv'
alias rrr='sudo xbps-remove -v -R'
alias ccc='sudo xbps-remove -v -ROof'
alias sss='xbps-query -v -Rs'
alias fff='xbps-query -v -R'

# Flatpak
alias fii='flatpak install'
alias fcc='flatpak uninstall --unused'
alias fuu='flatpak update'
alias frr='flatpak uninstall'
alias fll='flatpak list'
alias fee='flatpak run'
alias fss='flatpak search'

# Git
alias gst='git status'
alias gaa='git add .'
alias gcm='git commit -m'
alias gps='git push'
alias gpl='git pull'

# Python
alias cvenv='python -m venv env'
alias avenv='source env/bin/activate'
alias dvenv='deactivate'

# NPM
alias nodemon='npx nodemon'
alias serve='npx serve -s'

# Commands
alias polybar='pkill polybar; sleep 1; polybar -q main -c /home/kino/.config/polybar/config.ini &'
alias xdgn='~/.local/bin/xdg-ninja/xdg-ninja.sh'
alias bat='bat --style=plain --paging=never --color=always'
alias clpfe="clear;pfetch;lsd -AlL --group-dirs=last --date=+'%d/%m/%y - %H:%M:%S' ~"
alias drag='dragon-drop -x'
alias wine='flatpak run org.winehq.Wine'
