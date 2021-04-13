#!/bin/bash

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [[ ! (-d "$HOME/.oh-my-zsh" || -d "/usr/share/oh-my-zsh") ]]; then
	git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
fi

if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
