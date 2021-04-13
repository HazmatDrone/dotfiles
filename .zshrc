#!/bin/zsh
# Start TMUX/SCREEN
	if [[ -z $STY && -z $TMUX ]]; then
		if [[ -n $(command -v tmux) ]]; then
			if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
				git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
			fi
			tmux attach -t Main || tmux new -s Main && exit

		elif [[ -n $SSH_CONNECTION ]]; then
			screen -x -R -U -p+  && exit
		fi
	fi

# oh-my-zsh config
	ZSH_THEME="bira-custom"
	DISABLE_UPDATE_PROMPT="true" #Auto updates
	HIST_STAMPS="yyyy-mm-dd"
	typeset -A ZSH_HIGHLIGHT_PATTERNS

	plugins=(dirhistory extract git python sudo zsh-256color zsh-syntax-highlighting z)
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
	ZSH_HIGHLIGHT_PATTERNS+=(
		'rm -rf *' 'fg=white,bold,bg=red'
	)

	if [ -d "/usr/share/oh-my-zsh" ]; then
		export ZSH="/usr/share/oh-my-zsh"
	else
		if [ ! -d "$HOME/.oh-my-zsh" ]; then
 			git clone https://github.com/robbyrussell/oh-my-zsh .oh-my-zsh
		fi
		export ZSH="$HOME/.oh-my-zsh"
	fi
	export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
	if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	fi
	source $ZSH/oh-my-zsh.sh



# Environmental Variables
	export EDITOR=nano
	export VISUAL=nano



# Aliases and Functions
if [[ -n $(command -v exa) ]]; then
	alias ls="exa -lgF --git"
else
	alias ls="ls -l"
fi
	alias rm="rm -rv"
	alias mv="mv -v"
	alias cp="cp -rv"
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

# Set PATH so it includes local bin if it exists
	LOCAL_BIN="$HOME/.local/bin"
	if [ -d "$LOCAL_BIN" ] ; then
		PATH="$LOCAL_BIN:$PATH"
	fi



# Device specific settings
	if [ -f .zshrc_local ]; then
		source .zshrc_local
	fi
fpath=($fpath ~/.zsh_completions)
