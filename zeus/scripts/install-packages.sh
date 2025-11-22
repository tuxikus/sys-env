#!/usr/bin/env bash
set -e

dnf install -y $(xargs < packages)
dnf group install -y development-tools

echo "done installing packages"
