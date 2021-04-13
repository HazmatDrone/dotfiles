#!/bin/zsh
# Start TMUX/SCREEN
	if [[ -z $STY && -z $TMUX ]]; then
		if [[ -n $(command -v tmux) ]]; then
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
	ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
	fpath=($fpath ~/.zsh_completions)
	plugins=(dirhistory extract git python sudo zsh-256color zsh-syntax-highlighting z)
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
	ZSH_HIGHLIGHT_PATTERNS+=(
		'rm -rf *' 'fg=white,bold,bg=red'
	)

	if [ -d "/usr/share/oh-my-zsh" ]; then
		export ZSH="/usr/share/oh-my-zsh"
	else
		export ZSH="$HOME/.oh-my-zsh"
	fi

	source $HOME/.zsh_install_plugins.sh
	source $ZSH/oh-my-zsh.sh
	source $HOME/.profile
