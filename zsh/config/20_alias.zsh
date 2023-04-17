#!/usr/bin/env zsh

if [ "$(uname)" = 'Darwin' ]; then
	alias readlink="greadlink "
	alias awk='gawk'
	alias sed='gsed'
	alias date='gdate'
	alias ls="ls -G"
	alias lh='ls -alh'
	alias ll='ls -al'
else
	alias ls="ls --color=auto -G"
	alias lh='ls --color=auto -alh'
	alias ll='ls --color=auto -al'
fi

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias relogin="exec $SHELL -l"

alias sudo='sudo '
alias v="vim "
alias vv="vim `greadlink -f ~/.vimrc | xargs dirname`"
alias vz="vim `greadlink -f ~/.zshrc | xargs dirname`"
alias sz="source ~/.zshrc"
alias vtmux="vim `readlink -f ~/.tmux.conf`"
alias stmux="tmux source ~/.tmux.conf"

# 現在時刻をunixtimestampで取得
alias now="date +%s"

# kill selected tmux session
alias ctmuxs="tmux ls -F \"#S\" | peco | xargs tmux kill-session -t"
alias ndselect="ndenv version --bare | peco | xargs ndenv global"
alias pip="python3 -m pip "

alias todolist="find . -type d -name .git -prune -o -type d -name 'node_modules*' -prune -o -type f -print | xargs grep -n 'TODO'"

# Docker関連
alias dlog="docker ps --format '{{.Names}}' | peco | xargs docker logs -f"
alias drm="docker ps -a --format '{{.Names}}' | peco | xargs docker rm -f"

# alias localaws="aws --profile localstack --endpoint=http://localhost:4566"

# gh
# alias propen="gh pr view --web"
# alias prview="gh pr view --web"
