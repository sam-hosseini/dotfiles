#!/usr/bin/env bash

DOTFILE_REPO=/Users/shos/personal/dotfiles

# vim
rm -f ~/.vimrc
ln -s "${DOTFILE_REPO}/vim/.vimrc" ~/.vimrc

# fish
rm -rf ~/.config/fish/{completions,functions,config.fish}
rm -rf ~/.config/omf
ln -s "${DOTFILE_REPO}/fish/completions" ~/.config/fish/completions
ln -s "${DOTFILE_REPO}/fish/functions"   ~/.config/fish/functions
ln -s "${DOTFILE_REPO}/fish/config.fish" ~/.config/fish/config.fish
ln -s "${DOTFILE_REPO}/fish/oh_my_fish"  ~/.config/omf

# powerline
rm -rf "${POWERLINE_ROOT_REPO}/powerline/config_files"
ln -s "${DOTFILE_REPO}/powerline" \
      "${POWERLINE_ROOT_REPO}/powerline/config_files"
# tmux
rm -f ~/.tmux.conf
ln -s "${DOTFILE_REPO}/tmux/.tmux.conf" ~/.tmux.conf
