#!/bin/bash

# TODO: install tmux

if type "dirname" > /dev/null 2>&1; then
	ln -sf $(cd $(dirname $0) && pwd)/.tmux.conf ~/
fi
