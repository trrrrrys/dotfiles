#!/bin/bash

# TODO: install tmux

if type "dirname" > /dev/null 2>&1; then
	ln -sf $(dirname $0)/.tmux.conf ~/
fi
