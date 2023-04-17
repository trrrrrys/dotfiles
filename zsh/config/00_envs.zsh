
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
	$path
)
# rtx
type rtx 1> /dev/null && source <(rtx activate zsh)
