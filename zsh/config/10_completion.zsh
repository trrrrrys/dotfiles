#!/usr/bin/env zsh

fpath=($HOME/.zsh_completions/ ${fpath})

autoload -Uz compinit
compinit
# 補完
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*:default' menu select=2
# 補完候補に色を付ける。
zstyle ':completion:*' list-colors "di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' insert-tab false
zstyle ':completion:*:sudo:*' command-path $path
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:vim:*' completer _files
