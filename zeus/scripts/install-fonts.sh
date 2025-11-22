#!/usr/bin/env bash

font_dir=$HOME/.local/share/fonts


iosevka_local=$(pwd)/assets/fonts/Iosevka-Extended.ttf
iosevka_target="$font_dir"/Iosevka

iosevka_term_local=$(pwd)/assets/fonts/IosevkaTerm-Extended.ttf
iosevka_term_target="$font_dir"/IosevkaTerm

if [ ! -d "$font_dir" ]; then
    mkdir -p "$font_dir"
fi

if [ ! -d "$iosevka_target" ]; then
    mkdir -p "$iosevka_target"
fi

if [ ! -d "$iosevka_term_target" ]; then
    mkdir -p "$iosevka_term_target"
fi

cp "$iosevka_term_local" "$iosevka_term_target"
cp "$iosevka_local" "$iosevka_target"

fc-cache -v > /dev/null

echo "done installing fonts"
