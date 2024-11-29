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

stow -S git
stow -S vim
stow -S tmux
stow -S nvim
stow -S zathura
stow -S i3
stow -S hypr
stow -S waybar
stow -S wlogout
stow -S rofi
stow -S alacritty
stow -S rofi
stow -S sway
stow -S bat
stow -S i3status
stow -S dunst
stow -S nvim
stow -S emacs

