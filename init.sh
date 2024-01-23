#!/bin/bash

func_prefix="init_"

function usage() {
  echo "Useage:"
  echo "  init.sh [commands]"
  echo ""
  echo "Examples:"
  echo "  init.sh brew"
  echo "  init.sh brew zsh"
  echo ""
  echo "Commands:"
  for fn in $func_list
  do
    if [[ "$fn" == *"$func_prefix"* ]]; then
      echo $fn | sed "s/$func_prefix//g" | xargs echo "  -"
    fi
  done
  echo $func_list | grep $func_prefix | sed "s/$func_prefix//g"
}

function init_brew() {
  echo "install brew"
  # install
  if [ -z `command -v brew` ]; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; fi

  # install packages
  brew bundle --file=./brew/Brewfile
}

function init_zsh() {
  echo "setup zsh"
  # zsh install check
	# zplug install
	if ! [ -d  ~/.zplug ]; then
		echo "install zplug"
		curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh;
	fi
	# create symbolic link
	if ! [ -z `command -v dirname` ]; then
		ln -sf $(cd $(dirname $0) && pwd)/zsh/.zshrc ~/
	fi
  curl -o ~/.zsh_completionss/_docker https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
  type zed 1> /dev/null && zed completion zsh > ~/.zsh_completions/_zed
  type gh 1> /dev/null && gh completion --shell zsh > ~/.zsh_completions/_gh
  type rtx 1> /dev/null && rtx completion zsh > ~/.zsh_completions/_rtx
  exec $SHELL -l
}

function init_gobins() {
  echo "install go binaries"
  cat ./gobins/gotools.txt | xargs -n1 go install
	ln -sf `pwd`/golangci-lint/.golangci.yaml $HOME/
}

func_list=`
	grep -Eo 'function [a-zA-Z0-9_]+ *\(\)' "$0" | \
 		sed -E 's/function? //; s/ *\(\)//'
`


if [ -z "$1" ]; then
  for fn in $func_list
  do
    if [[ "$fn" == *"$func_prefix"* ]]; then
      $fn
    fi
  done
fi

# help check
for arg in "$@"
do
  if [ "$arg" == "-h" ] || [ "$arg" == "--help" ]; then
    usage
    exit 0
  fi
done

for arg in "$@"
do
	for func_name in $func_list; do
		if [ "$func_prefix$arg" == "$func_name" ]; then
			"$func_prefix$arg"
			break
		fi
	done
done
