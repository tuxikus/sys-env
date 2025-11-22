#!/usr/bin/env bash

backup1="/mnt/backup1"

if [ ! -d "$backup1" ]; then
    mkdir -p "$backup1"
    chown -R tuxikus:tuxikus "$backup1"
fi

echo "done setting up directories"
