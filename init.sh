#!/bin/bash

func_prefix="init_"

function init_zsh() {
	# zplug install
	if ! [ -d  ~/.zplug ]; then
		echo "install zplug"
		curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh;
	fi
	# create symbolic link 
	if ! [ -z `command -v dirname` ]; then
		ln -sf $(cd $(dirname $0) && pwd)/zsh/.zshrc ~/
	fi
}

func_list=`
	grep -Eo 'function [a-zA-Z0-9_]+ *\(\)' "$0" | \
 		sed -E 's/function? //; s/ *\(\)//'
`

if [ -z "$1" ]; then
  echo "keyword: "
	echo $func_list
  exit 0
fi


for arg in "$@"
do
	for func_name in $func_list; do
		if [ "$func_prefix$arg" == "$func_name" ]; then
			"$func_prefix$arg" 
			break
		fi
	done
done
