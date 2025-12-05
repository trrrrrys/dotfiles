#!/usr/bin/env zsh
bindkey -v
bindkey '^a' beginning-of-line
# bindkey '^b' vi-backward-blank-word
# bindkey '^d' backward-delete-word
bindkey '^g' _zle_gcd
bindkey '^p' up-line-or-history
bindkey '^n' down-line-or-history
bindkey '^r' _zle_history_search
bindkey '^f' _zle_search_directory
bindkey -s '^s' ''
bindkey '^k' up-line-or-history
bindkey '^j' down-line-or-history
# bindkey '^w' vi-forward-blank-word
# bindkey '^w' vi-forward-blank-word
