#!/bin/bash

git pull --rebase

cp ~/.zshrc ./.zshrc
cp ~/.tmux.conf ./.tmux.conf
rm -rf ./nvim
cp -R ~/.config/nvim ./

