#!/bin/bash
# Script 2: FOSS Package Inspector

PACKAGE="git"

if dpkg -l | grep -q "^ii  $PACKAGE"; then
    echo "$PACKAGE is installed."
    dpkg -l $PACKAGE | grep -E 'Version'
else
    echo "$PACKAGE is NOT installed."
fi

case $PACKAGE in
    git) echo "Git: distributed version control for open collaboration" ;;
    apache2) echo "Apache: web server powering internet" ;;
    mysql) echo "MySQL: open database system" ;;
    vlc) echo "VLC: open media player" ;;
esac
