#!/bin/sh
# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# zsh
curl -L git.io/antigen > ~/antigen.zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# alacritty
ln -sf ~/dotfiles/.alacritty.toml ~/.alacritty.toml

# vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# nvim
ln -s ~/dotfiles/nvim ~/.config/nvim
