#!/bin/bash
#source /etc/profile

export EDITOR=/bin/nano
export VISUAL=/bin/nano

# Aliases and Functions
	alias cp="cp -rv"
	alias cg="cd '$(git rev-parse --show-toplevel)'"
	alias clear=":;clear"
	alias edit="$EDITOR"
	alias fucking="sudo"
	alias gitresin="git config user.name \"HazmatDrone\"; git config user.email \"drone@hazmatdr.one\""
	alias githazmat="git config user.name \"Resin Drake\"; git config user.email \"resin@resindrake.net\""
	alias help="man"
	alias hexdump="hexdump -C"
	alias less="less -F"
	alias ls=ls_fn
	ls_fn(){
		if [[ $COLUMNS -gt 75 ]]; then LFLAG='-l'; fi
		if [[ -n $(command -v exa) ]]
			then exa $LFLAG -gF --git $@
			else /bin/ls $LFLAG $@
		fi
	}
	alias mkdir="mkdir -pv"
	alias mv="mv -v"
	alias players='curl -s https://api.mcsrvstat.us/2/krutonium.ca | jq '\''.["players"]'\'
	alias rm="rm -rv"
	alias scp="scp -r"
	alias screen="screen -RU"
	      svg(){ curl -O "https://simpleicons.org/icons/$1.svg" }
	alias tmux="tmux attach || tmux"
	alias neofetch="clear;neofetch"
	alias screenclr="screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill"
	alias watch="watch -c"
	      weather() { if [[ -n $1 ]]; then place=$1; fi; curl -sNL wttr.in/$place | head -7 }
	alias worldmap="tput civis; while asciiworld -soTl .worldpts -c8; do sleep 1; tput home; done"
	alias yay="yay --sudoloop"
	alias yayy='tmux new-window "tmux set monitor-silence 10; tmux set remain-on-exit yes; yay"'

# Set PATH so it includes local bin
	PATH="$PATH:/home/resin/.gem/ruby/2.7.0/bin"
	PATH="$PATH:$HOME/.local/bin"

