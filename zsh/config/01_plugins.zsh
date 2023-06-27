#!/usr/bin/env zsh

# zplug
source ~/.zplug/init.zsh
# 補完
zplug 'zsh-users/zsh-completions'
zplug 'zchee/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-autosuggestions'
zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
# zplug check || zplug install
zplug load

autoload -Uz colors add-zsh-hook is-at-latest
colors

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,underline'
