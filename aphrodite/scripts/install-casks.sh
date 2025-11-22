#!/usr/bin/env bash
set -e

brew install --cask $(xargs < casks)

echo "done installing casks"
