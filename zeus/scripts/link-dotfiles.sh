#!/usr/bin/env bash

if [[ ! -h "$HOME/.bashrc" ]]; then
    rm "$HOME/.bashrc"
fi

cd dotfiles
stow           \
    tmux       \
    alacritty  \
    bash       \
    sway       \
    fuzzel     \
    -t "$HOME"

echo "done linking dotfiles"
