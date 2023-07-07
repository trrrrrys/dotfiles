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
  case $1 in
    -6)
      curl -6 ifconfig.io
      ;;
    -4)
      curl -4 ifconfig.io
      ;;
    *)
      curl ifconfig.io
      ;;
  esac
}

# ghqディレクトリを移動するやつ
gcd() {
  type ghq 1> /dev/null || { echo "ghq required, see: https://github.com/x-motemen/ghq"; return 1; }
  type peco 1> /dev/null || { echo "peco required, see: https://github.com/peco/peco"; return 1; }

  local _cmd _item _path

  # 引数をとった場合はデフォルトでgrepをかける
  if [[ $# -ge 1 ]]; then
    local _cmd="ghq list | grep"
    for _item in "$@"
    do
      _cmd+=" -e $_item"
    done
    _path=$(eval $_cmd | peco --query "$LBUFFER")
  else
    _path=$(ghq list | peco --query "$LBUFFER")
  fi
  if [[ -n $_path ]]; then
    cd `ghq root`/$_path
  fi
}

gcdh() {
  type ghq 1> /dev/null || { echo "ghq required, see: https://github.com/x-motemen/ghq"; return 1; }
  type peco 1> /dev/null || { echo "peco required, see: https://github.com/peco/peco"; return 1; }
  local _path
  ls -d `ghq root`/*/* | sed "s,`ghq root`/,,g" | peco | read _path
  if [[ -n $_path ]]; then
    cd `ghq root`/$_path
  fi
}

_zle_gcd() {
  local _path
  type ghq peco 1> /dev/null || return 1
  _path=$(ghq list | peco  --query "$LBUFFER")
  BUFFER=""
  if [[ -n $_path ]]; then
    cd `ghq root`/$_path
  fi
  zle accept-line
}
zle -N _zle_gcd

# history search
_zle_history_search() {
  BUFFER=$(fc -l -n 1 | tail -r | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  print -z
  zle redisplay
}
zle -N _zle_history_search

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

# 検索
search() {
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

setenv-awscredential() {
  local profile=`aws configure list-profiles | peco`
  echo $profile
  export AWS_ACCESS_KEY_ID=`aws --profile $profile configure get aws_access_key_id`
  export AWS_SECRET_ACCESS_KEY=`aws --profile $profile configure get aws_secret_access_key`
}

dotenv() {
  local fp=".env"
  # 引数をとった場合はデフォルトでgrepをかける
  if [[ $# -ge 1 ]]; then
    fp="$1"
  fi
  if [[ -r "$fp" ]]; then
    while IFS= read -r line; do
      if [[ ! -z $line ]]; then
        eval "export $line"
      fi
    done < "$fp"
  fi
}

toggle-vi-mode() {
  if [[ $KEYMAP == "vicmd" ]]; then
    zle vi-insert
  else
    zle vi-cmd-mode
  fi
}
zle -N toggle-vi-mode


docker-exec() {
  local _container_id=`docker ps --format "{{.Names}}" | peco | xargs -I{} docker ps -a -q -f "name={}"`
  local cmd="bash"
  if [[ $# -ge 1 ]]; then
    cmd=$@
  fi
  docker exec -it $_container_id $cmd
}


decode_jwt() {
  local parts=("${(@s:.:)1}")
  local result="${parts[2]}"
  local len=$((${#result} % 4))
  if [ $len -eq 1 ]; then result="$1"'==='
  elif [ $len -eq 2 ]; then result="$1"'=='
  elif [ $len -eq 3 ]; then result="$1"'='
  fi
  echo "$result" | tr '_-' '/+' | base64 -d | jq .
}
