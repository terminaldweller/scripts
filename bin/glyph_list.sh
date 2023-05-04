#!/usr/bin/env sh

cat ~/scripts/glyphs/glyph_list | dmenu -fn "DejaVuSansMono Nerd Font Mono-11.3;antialias=true;autohint=true" -l 20 -D ":" -p "glyphs:" | tr -d "\n" | xsel -ib
