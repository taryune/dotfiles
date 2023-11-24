#!/bin/sh
# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
# antigen
curl -L git.io/antigen > ~/antigen.zsh

ln -sf ~/dotfiles/.alacritty.yml ~/.alacritty.yml
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.yabairc ~/.yabairc
ln -sf ~/dotfiles/.skhdrc ~/.skhdrc
ln -sf ~/dotfiles/.dein.toml ~/.dein.toml
ln -sf ~/dotfiles/.dein_lazy.toml ~/.dein_lazy.toml
ln -sf ~/dotfiles/.latexmkrc ~/.
ln -sf ~/dotfiles/.textlintrc ~/.
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/astro.vim ~/.config/nvim/ftdetect/astro.vim
ln -sf ~/dotfiles/config.js ~/.config/oni/config.js
ln -sf ~/dotfiles/coc-setting.vim ~/.config/nvim/.
ln -sf ~/dotfiles/coc-settings.json ~/.config/nvim/.
ln -sf ~/dotfiles/efm-config.yaml ~/.config/efm-langserver/config.yaml
