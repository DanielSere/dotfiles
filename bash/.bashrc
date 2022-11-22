# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Set up starship
eval "$(starship init bash)"

# Alias
alias cl='clear'
alias xxx='exit'
alias ...='cd ..'
# Flatpak
alias fii='flatpak install'
alias fcc='flatpak uninstall --unused'
alias fuu='flatpak update'
alias frr='flatpak uninstall'
alias fll='flatpak list'
alias flatseal='flatpak run com.github.tchx84.Flatseal'
alias lapce='flatpak run dev.lapce.lapce'
alias librewolf='flatpak run io.gitlab.librewolf-community'
alias wine='flatpak run org.winehq.Wine'
# Python
alias cvenv='python -m venv env'
alias avenv='source env/bin/activate'
alias dvenv='deactivate'
# Wine
alias wine='flatpak run org.winehq.Wine'
# NPM
alias vtop='npx vtop'
alias nodemon='npx nodemon'
alias serve='npx serve -s'
# XBPS
alias iii='sudo xbps-install -S'
alias uuu='sudo xbps-install -Su'
alias rrr='sudo xbps-remove -Rf'
alias ccc='sudo xbps-remove -Oofv'
# Others
alias lll='lsd -la'
alias ssh-gen="ssh-keygen -t rsa -b 4069 -C"




PS1='[\u@\h \W]\$ '
