
eval $(/opt/homebrew/bin/brew shellenv)
# GOPATH
export GOPATH=$HOME/go
# path
path=(
	$GOPATH/bin
	/usr/local/bin
	/usr/local/go/bin
	$HOME/bin
	$HOME/.local/bin
	$HOME/google-cloud-sdk/bin
	$HOME/.cargo/bin
	/opt/homebrew/opt/mysql-client/bin
	/opt/homebrew/opt/redis@6.2/bin
  /opt/homebrew/opt/openjdk@11/bin
	$path
)

export EDITOR="vim"
export LANG=en_US.UTF-8
export MANPAGER="col -b -x|vim -R -c 'set ft=man nolist nomod noma' -"

# rtx
type rtx 1> /dev/null && source <(rtx activate zsh)
source "$HOME/.cargo/env"

# bun
# bun completions
[ -s "/Users/tsukahara-ryo/.bun/_bun" ] && source "/Users/tsukahara-ryo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
