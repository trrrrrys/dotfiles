#!/bin/bash
if type "dirname" > /dev/null 2>&1; then
	basepath=$(cd $(dirname $0) && pwd)
	mkdir -p $HOME/.config/alacritty/
	ln -sf $basepath/alacritty.yml $HOME/.config/alacritty/alacritty.yml
fi
