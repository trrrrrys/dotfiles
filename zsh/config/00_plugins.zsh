fpath=(/usr/local/share/zsh/functions ${fpath})
# zplug
source ~/.zplug/init.zsh
# 補完
zplug 'zsh-users/zsh-completions'
# 
zplug 'zsh-users/zaw'
# 
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
# 
zplug 'zsh-users/zsh-autosuggestions'
# 
zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
zplug check || zplug install

### cdr の設定 (zplug load 前に書かないと zaw-cdr がスキップされる)
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook is-at-least
if is-at-least 4.3.10; then
	add-zsh-hook chpwd chpwd_recent_dirs
	zstyle ':chpwd:*' recent-dirs-max 5000
	zstyle ':chpwd:*' recent-dirs-default yes
fi

zplug load

autoload -U colors && colors
