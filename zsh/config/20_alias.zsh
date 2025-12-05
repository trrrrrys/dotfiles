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

alias re="exec $SHELL -l"
alias relogin="exec $SHELL -l"

alias sudo='sudo '
alias v="vim "
alias v.="vim ."
alias vv="vim `greadlink -f ~/.vimrc | xargs dirname`"
alias vz="vim `greadlink -f ~/.zshrc | xargs dirname`"
alias vg="vim ~/.config/git/"
alias sz="source ~/.zshrc"
alias vtmux="vim `readlink -f ~/.tmux.conf`"
alias stmux="tmux source ~/.tmux.conf"

# 現在時刻をunixtimestampで取得
alias now="date +%s"

# kill selected tmux session
alias ctmuxs="tmux ls -F \"#S\" | peco | xargs tmux kill-session -t"
alias pip="python3 -m pip "

alias todolist="find . -type d -name .git -prune -o -type d -name 'node_modules*' -prune -o -type f -print | xargs grep -n 'TODO'"

alias du="dust"

# Docker関連
alias dlog="docker ps -a --format '{{.Names}}' | peco | xargs docker logs -f -n 100"
alias drm="docker ps -a --format '{{.Names}}' | peco | xargs docker rm -f"
alias dps="docker ps --format 'table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'"

alias localaws='aws --profile localstack --endpoint="http://localhost:4566"'

# gh
alias ghopen="gh repo view --web"
alias ghdash="gh dash"
alias propen="gh pr view --web"
alias prview="gh pr view --web"
alias prdraft="gh pr create --base main -a '@me' -d && gh pr view --web"

prdraftsp() {
  local _branchName=$(git branch -r --format='%(refname:short)' | sed 's/^origin\///' | tac | peco --query='release/sp' | tr -d '\\n')
  gh pr create -a '@me' -d --base $_branchName && gh pr view --web
}


# git
alias cdgr="git rev-parse --is-inside-work-tree > /dev/null 2>&1 && git rev-parse --show-toplevel"

alias clasp="deno run -A npm:@google/clasp"
