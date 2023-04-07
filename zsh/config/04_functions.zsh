
function dkill() {
  read Confirm\?"kill all docker container [Y/y] > "
  case $Confirm in
    '' | [Yy]* )
      echo "=== docker container delete all ==="
      docker ps -aq | xargs docker rm -f
      ;;
    * )
      echo "=== Canceled ==="
      ;;
  esac
}

##################
function mcd() {
	echo $1;
	if [[ $? -eq 0 ]]; then
			echo "mcd"
			mkdir -p $1; cd $1;
	fi
}

# 現在のIPアドレス取得
function cip() {
    curl ifconfig.io
}

function gcd {
	local cmd item _path
  type ghq peco 1> /dev/null || return 1

  # 引数をとった場合はデフォルトでgrepをかける
  if [[ $# -ge 1 ]]; then
    local cmd="ghq list --full-path | grep"
    for item in "$@"
    do
      cmd+=" -e $item"
    done
    _path=$(eval $cmd | peco)
  else
    _path=$(ghq list --full-path | peco)
  fi

  if [[ -n $_path ]]; then
    cd $_path
  fi
}

function _zle_gcd {
	local _path
  type ghq peco 1> /dev/null || return 1
  _path=$(ghq list --full-path | peco)
	zle accept-and-hold
  if [[ -n $_path ]]; then
		BUFFER=""
		cd $_path
  fi
}

zle -N _zle_gcd
bindkey '^g' _zle_gcd
