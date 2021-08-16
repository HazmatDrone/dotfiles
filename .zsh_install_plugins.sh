#!/bin/bash

if [ -d "/usr/share/oh-my-zsh" ]; then
	export ZSH="/usr/share/oh-my-zsh"
else
	if [[ ! (-d "$HOME/.oh-my-zsh" || -d "/usr/share/oh-my-zsh") ]]; then
		git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
	fi
	export ZSH="$HOME/.oh-my-zsh"
fi

if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-256color" ]; then
	git clone https://github.com/chrissicool/zsh-256color $ZSH_CUSTOM/plugins/zsh-256color
fi

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [[ ! -d "$HOME/.tmux/tdab" ]]; then
	git clone https://github.com/uriel1998/tdab $HOME/.tmux/tdab
fi
