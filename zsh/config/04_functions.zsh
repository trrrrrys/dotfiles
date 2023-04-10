#!/usr/bin/env zsh

dkill() {
  read Confirm\?"kill all docker container [Y/y] > "
  case $Confirm in
    [Yy]* )
      echo "=== docker container delete all ==="
      docker ps -aq | xargs docker rm -f
      ;;
    * )
      echo "=== Canceled ==="
      ;;
  esac
}

# mkdirしてcdする
mcd() {
	if [[ $? -eq 0 ]]; then
			echo "mcd"
			mkdir -p $1; cd $1;
	fi
}

# 現在のIPアドレス取得
cip() {
  case $n in
    * )
      echo "=== Canceled ==="
      ;;
	esac
	curl ifconfig.io
}

gcd() {
  type ghq 1> /dev/null || { echo "ghq required, see: https://github.com/x-motemen/ghq"; return 1; }
  type peco 1> /dev/null || { echo "peco required, see: https://github.com/peco/peco"; return 1; }

	local _cmd _item _path

  # 引数をとった場合はデフォルトでgrepをかける
  if [[ $# -ge 1 ]]; then
    local _cmd="ghq list --full-path | grep"
    for _item in "$@"
    do
      _cmd+=" -e $_item"
    done
    _path=$(eval $_cmd | peco)
  else
    _path=$(ghq list --full-path | peco)
  fi

  if [[ -n $_path ]]; then
    cd $_path
  fi
}

gcdh() {
  type ghq 1> /dev/null || { echo "ghq required, see: https://github.com/x-motemen/ghq"; return 1; }
  type peco 1> /dev/null || { echo "peco required, see: https://github.com/peco/peco"; return 1; }
	local _path 
	ls -d `ghq root`/*/* | sed "s,$HOME,~,g" | peco | read _path
  if [[ -n $_path ]]; then
    cd $_path
  fi
}

_zle_gcd() {
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

# typescriptの初期化系
tsinit() {
	npm init --init-author-name="trrrrrys" --init-author-email="email=tsukahararu@gmail.com" -y
	mkdir -p src
	touch src/index.ts
	npm set main 
	npm install --save-dev typescript ts-node
	npm pkg set scripts.start="ts-node src/index.ts"
	npm pkg set main="src/index.ts"
}

sif() {
	local search_directory="."
	local excluded_patterns=()
	local search_keywords=()

	while (( $# > 0 )); do
		case $1 in
			-v)
				excluded_patterns+=("$2")
				shift 2
				;;
			-d)
				search_directory="$2"
				shift 2
				;;
			*)
				search_keywords+=("$1")
				shift
				;;
		esac
	done

	# search_keywords は 1つ以上必要
	if [[ ${#search_keywords[@]} -eq 0 ]]; then
		echo "require keyword"
		return
	fi

	# 引数のキーワードを正規表現用に パイプ繋ぎでセットする
	local _keywords="${search_keywords[1]}"
	for k in "${search_keywords[@]:1}"; do
		_keywords+="|$k"
	done
	search_directory=`echo $search_directory | sed "s/\/$//g"`
 	local _cmd="find ${search_directory} -type f"
	for e in ${excluded_patterns[@]}; do
		_cmd+=" | grep -v "$e
	done
	eval $_cmd | xargs -I{} grep -Hn -E --binary-files=without-match  "$_keywords" "{}" | \
						gsed -e "s/\(:[0-9]\+:\)/\1 /" | \
						awk '{
							r = ""; \
							for (i = 2; i <= NF; ++i) r = r (i == 2 ? "" : " ") gsub(/('$_keywords')/, "\x1b[45m&\x1b[0m", $i);\
							$1="\x1b[31m"$1"\x1b[39m\n\t";\
							print \
						}'
}

# SIGINT をキャッチできる
# function TRAPINT {
#
# }
