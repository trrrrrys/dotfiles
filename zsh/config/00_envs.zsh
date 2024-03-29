
eval $(/opt/homebrew/bin/brew shellenv)
export GOPATH=$HOME/go
export MISE_GO_SET_GOBIN=false
export GOBIN=$GOPATH/bin
# path
path=(
	$GOBIN
	/usr/local/bin
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

# mise
type mise 1> /dev/null && source <(mise activate zsh)
[ -s "$HOME/.cargo/env" ] && source $HOME/.cargo/env

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/Users/tsukahara-ryo/.bun/_bun" ] && source "/Users/tsukahara-ryo/.bun/_bun"

[ -s "$HOME/.config/op/plugins.sh" ] && source $HOME/.config/op/plugins.sh
