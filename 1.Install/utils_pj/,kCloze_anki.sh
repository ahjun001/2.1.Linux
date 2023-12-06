#!/usr/bin/env bash

xclip -o |
    sed '/\[sound:/s/ / ::/' |
    sed '/\[sound:/s/^/{{c::/' |
    sed -e '/\[sound:/{N;N;s/$/\}\}/}' |
    xclip -selection clipboard

# make a soft link in /usr/local/sbin
LINK=/usr/local/sbin/"${0##*/}"
FILE=$(realpath "$0")
[[ -L $LINK ]] || sudo ln -fs "$FILE" "$LINK"
