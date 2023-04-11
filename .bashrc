#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set up starship
eval "$(starship init bash)"

###########
## Alias ##
###########

# Basics
alias la='lsd -la'
alias ls='lsd -l'
alias cl='clear'
alias rm='rm -rf'
alias xx='exit'
alias ..='cd ..'
alias ldc='lsd -la ~/Documents/'
alias ldw='lsd -la ~/Downloads/'
alias lmu='lsd -la ~/Music/'
alias lpi='lsd -la ~/Pictures/'
alias lvi='lsd -la ~/Videos/'
alias l.c='lsd -la ~/.config/'
alias cdc='cd ~/Documents/'
alias cdw='cd ~/Downloads/'
alias cmu='cd ~/Music/'
alias cpi='cd ~/Pictures/'
alias cvi='cd ~/Videos/'
alias c.c='cd ~/.config/'

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

# XBPS
alias iii='sudo vpm --color=yes install'
alias uuu='sudo vpm --color=yes update'
alias rrr='sudo vpm --color=yes removerecursive'
alias ccc='xbps-remove -n -v -ROof'
alias sss='vpm --color=yes search'
alias fff='vpm --color=yes info'

# Commands
alias edit-sudo='sudo -Es nvim /etc/sudoers.d/wheel'
alias edit-grub='sudo -Es nvim /etc/default/grub'
alias polybar='pkill polybar; sleep 1; polybar -q main -c /home/kino/.config/polybar/config.ini &'
alias xdgn='~/.local/bin/xdg-ninja/xdg-ninja.sh'
alias ssh-gen='ssh-keygen -t rsa -b 4069 -C'
alias bat='bat --style=plain --paging=never --color=always'
alias clpfe='clear;pfetch'


# alias librewolf='flatpak run io.gitlab.librewolf-community &'
# alias peazip='flatpak run io.github.peazip.Peazip &'
# alias flatseal='flatpak run com.github.tchx84.Flatseal &'
# alias mgba='flatpak run io.mgba.mGBA &'
# alias smplayer='flatpak run info.smplayer.SMPlayer'

# alias codium='(sleep 5 ; rm -rf ~/.pki/ ~/.vscode-oss/) & ~/.bin/vscodium/bin/codium --user-data-dir ~/.config/VSCodium/ --extensions-dir ~/.config/VSCodium/extensions/'
