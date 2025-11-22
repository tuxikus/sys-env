#!/usr/bin/env bash
set -e

brew install $(xargs < packages)

echo "done installing packages"
