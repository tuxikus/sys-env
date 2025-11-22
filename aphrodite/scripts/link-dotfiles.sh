#!/usr/bin/env bash

config_dir="$HOME/.config/"

# create dirs if not exist
if ! [ -d "$config_dir/tmux/" ]; then
	mkdir "$config_dir/tmux/"
fi

if [ -d "$config_dir/fish/" ]; then
	rm -rf "$config_dir/fish"
	mkdir "$config_dir/fish/"
else
	mkdir "$config_dir/fish/"
fi

cd dotfiles
stow           \
    alacritty  \
    zellij     \
    zsh        \
    eza        \
    yazi       \
    helix      \
    doom       \
    fish       \
    centaur    \
    lazygit    \
    nvim       \
    tmux       \
    tmux-sessionizer       \
    -t "$HOME"

echo "done linking dotfiles"
