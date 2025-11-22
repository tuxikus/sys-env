#!/usr/bin/env bash

echo "Updating the system"
./scripts/update.sh

echo "Installing packages from package file..."
./scripts/install-packages.sh

echo "Installing casks from casks file..."
./scripts/install-casks.sh

echo "Installing go packages..."
./scripts/install-go-packages.sh

echo "Linking dotfiles..."
./scripts/link-dotfiles.sh

echo "Linking bin..."
./scripts/link-bin.sh
