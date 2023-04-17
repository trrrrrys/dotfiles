#!/usr/bin/env zsh

fpath=(/usr/share/zsh/$ZSH_VERSION/functions ${fpath})
# zplug
source ~/.zplug/init.zsh
# 補完
zplug 'zsh-users/zsh-completions'
zplug 'zchee/zsh-completions'
zplug 'zsh-users/zaw'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-autosuggestions'
zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
# zplug check || zplug install
zplug load

####
# autoload
####

autoload -Uz colors && colors
autoload -Uz compinit && compinit
autoload -Uz \
	add-zsh-hook \
	is-at-least

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,underline'
