#!/bin/bash

[[ -e ~/.zshrc ]] && cp ~/.zshrc ~/.zshrc.old
cp ./.zshrc ~/.zshrc

[[ -e ~/.tmux.conf ]] && cp ~/.tmux.conf ~/.tmux.conf.old
cp ./.tmux.conf ~/.tmux.conf

[[ -e ~/.config/nvim ]] && cp -R ~/.config/nvim ~/.config/nvim_old
rm -rf ~/.config/nvim
cp -R ./nvim ~/.config

