#!/bin/bash

# vim-plug install
if [ ! ~/.vim/autoload/plug.vim ]; then
	echo "=== install vim-plug ==="
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
fi

# TODO: フォントインストール

# create symbolic link
if type "dirname" > /dev/null 2>&1; then
	ln -sf $(cd $(dirname $0) && pwd)/.vimrc ~/
	ln -sf $(cd $(dirname $0) && pwd) ~/.vim/_config
fi

