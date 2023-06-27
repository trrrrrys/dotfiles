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

function init_zsh_completion() {
  curl -o ~/.zsh_completionss/_docker https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
  type zed 1> /dev/null && zed completion zsh > ~/.zsh_completions/_zed
  type gh 1> /dev/null && gh completion --shell zsh > ~/.zsh_completions/_gh
  type rtx 1> /dev/null && rtx completion zsh > ~/.zsh_completions/_rtx
  exec $SHELL -l 
}

function init_brew() { 
  # install 
  if [ -z `command -v brew` ]; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; fi
}

function init_gobins() { 
  cat ./gobins/gotools.txt | xargs -n1 go install
	ln -sf `pwd`/golangci-lint/.golangci.yaml $HOME/
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
