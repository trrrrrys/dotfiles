
# macOS
# alias readlink="greadlink "

alias ls="ls --color=auto -G"
alias lh='ls --color=auto -alh'
alias ll='ls --color=auto -al'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias relogin="exec $SHELL -l"

# git diff and peco
alias gd="git status -s -uno | awk '{ print \$2 }' | peco  | xargs git diff"

alias sudo='sudo '
alias v="vim "
alias _vv="readlink -f ~/.vimrc | xargs dirname | xargs -o vim"
alias vv="vim (readlink -f ~/.vimrc | xargs dirname)"
alias vf="vim (readlink -f ~/.config/fish/conf.d | xargs dirname)"
alias vz="vim (readlink -f ~/.zshrc | xargs dirname)"
alias sz="source ~/.zshrc"
alias vb="vim (echo ~/.bashrc && echo ~/.bash_profile | peco )"
alias sb="echo ~/.bashrc && echo ~/.bash_profile | peco | xargs source"
alias vtmux="vim (readlink -f ~/.tmux.conf)"
alias stmux="tmux source ~/.tmux.conf"


# Docker関連
alias d="docker "
alias dps="docker ps"
alias dcom="docker-compose "
alias dlog="docker ps --format '{{.Names}}' | peco | xargs docker logs -f"
alias drm="docker ps -a --format '{{.Names}}' | peco | xargs docker rm -f"

# kubectl
alias k="kubectl "
alias kp="kubectl get pod -n "

# pwdしてコピー
alias pwc="pwd | pbcopy"

# 現在時刻をunixtimestampで取得
alias now="date +%s"

# kill selected tmux session
alias ctmuxs="tmux ls -F \"#S\" | peco | xargs tmux kill-session -t"
alias ndselect="ndenv version --bare | peco | xargs ndenv global"
alias pip="python3 -m pip "
alias bat="batcat"

