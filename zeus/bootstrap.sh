#!/usr/bin/env bash

echo "Updating system..."
sudo ./scripts/update.sh

echo "Installing packages from package file..."
sudo ./scripts/install-packages.sh

echo "Installing fonts..."
./scripts/install-fonts.sh

echo "Setting up directories..."
sudo ./scripts/setup-dirs.sh

echo "Linking dotfiles..."
./scripts/link-dotfiles.sh

echo "Setting up git..."
./scripts/setup-git.sh
