
set GOPATH $HOME/go
set GO111MODULE on
set GOMAXPROCS 1

# TODO: MANPATH の設定
set PATH \
	$GOPATH/bin \
	/usr/local/bin \
	/usr/local/go/bin \
	$HOME/bin \
	$HOME/.local/bin \
	$HOME/google-cloud-sdk/bin \
	$HOME/.nodenv/bin \
	# $HOME/$PYENV_ROOT/bin \
	$HOME/.cargo/bin \
	$PATH

set CLOUDSDK_PYTHON /usr/bin/python2.7
source (nodenv init - | psub)
# set PYENV_ROOT $HOME/.pyenv
# source (pyenv init - | psub)

set LANG ja_JP.UTF-8
