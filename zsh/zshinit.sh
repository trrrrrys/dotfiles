#!/bin/bash

# TODO: install zsh

# zplug install
if ! type "zplug" > /dev/null 2>&1; then
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh;
fi

# create symbolic link 
if type "dirname" > /dev/null 2>&1; then
	ln -sf $(cd $(dirname $0) && pwd)/.zshrc ~/
fi

