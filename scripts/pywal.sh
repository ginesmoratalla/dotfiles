#!/usr/bin/env bash

test=$(gsettings get org.gnome.desktop.background picture-uri | sed -e "s/^'file:\/\///" -e "s/'$//")
wal -i "$test"
