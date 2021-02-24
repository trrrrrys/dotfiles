#!/bin/bash

# TODO: install fish shell
# install fisher
if ! type "fisher" > /dev/null 2>&1; then
	curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fi
