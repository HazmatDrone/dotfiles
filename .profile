#!/bin/bash
#source /etc/profile

export EDITOR=/usr/bin/nano
export PATH="/home/resin/.gem/ruby/2.7.0/bin:$PATH"
export PROFILE="worked"

# Aliases and Functions

if [[ -n $(command -v exa) ]]; then
	alias ls="exa -lgF --git"
else
	alias ls="ls -l"
fi
	alias rm="rm -rv"
	alias mv="mv -v"
	alias cp="cp -rv"
	alias cg="cd '$(git rev-parse --show-toplevel)'"
	alias mkdir="mkdir -pv"
	alias hexdump="hexdump -C"
	alias watch="watch -c"

	alias scp="scp -r"
	alias screen="screen -RU"
	alias tmux="tmux attach || tmux"
	alias neofetch="clear;neofetch"
	alias screenclr="screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill"
	alias worldmap="tput civis; while asciiworld -soTl .worldpts -c8; do sleep 1; tput home; done"
	weather() { if [[ -n $1 ]]; then place=$1; fi; curl -sNL wttr.in/$place | head -7 }
	svg(){ curl -O "https://simpleicons.org/icons/$1.svg" }
	alias gitresin="git config user.name \"HazmatDrone\"; git config user.email \"drone@hazmatdr.one\""
	alias githazmat="git config user.name \"Resin Drake\"; git config user.email \"resin@resindrake.net\""
	alias less="less -F"
	alias fucking="sudo"

# Set PATH so it includes local bin
	PATH="$PATH:$HOME/.local/bin"
