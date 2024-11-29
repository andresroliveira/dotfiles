#!/usr/bin/env sh

# Verifing the dependencies

if ! command -v git &> /dev/null
then
    echo "git could not be found"
    exit
fi

if ! command -v stow &> /dev/null
then
    echo "stow could not be found"
    exit
fi

# stow -D git
# stow -D vim
# stow -D tmux
# stow -D nvim
# stow -D zathura
# stow -D i3
# stow -D hypr
# stow -D waybar
# stow -D wlogout
# stow -D rofi
# stow -D alacritty
# stow -D rofi
# stow -D sway
# stow -D bat
# stow -D i3status
# stow -D dunst
# stow -D nvim
# stow -D emacs
