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

# # history search
# _zle_history_search() {
#   local _path
#   type peco 1> /dev/null || return 1
#   _path=$(find . -type f)
#   BUFFER=""
#   if [[ -n $_path ]]; then
#     cd `ghq root`/$_path
#   fi
#   zle accept-line
# }
# zle -N _zle_history_search

# typescriptの初期化系
tsinit() {
  npm init --init-author-name="trrrrrys" --init-author-email="email=tsukahararu@gmail.com" -y
  mkdir -p src
  touch src/index.ts
  npm install --save-dev typescript ts-node
  npm pkg set scripts.start="ts-node src/index.ts"
  npm pkg set main="src/index.ts"
}

# 検索
search() {
  local search_directory="."
  local excluded_patterns=(".git" "node_modules")
  local match_patterns=()
  local search_keywords=()

  while (( $# > 0 )); do
    case $1 in
      -v)
        excluded_patterns+=("$2")
        shift 2
        ;;
      -m)
        match_patterns+=("$2")
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
  local _cmd="grep -rEHn --binary-files=without-match"
  for m in "${match_patterns[@]}"; do
    _cmd+=" --include=$m"
  done
  for e in "${excluded_patterns[@]}"; do
    _cmd+=" --exclude-dir=$e"
  done
  _cmd+=" -e \"$_keywords\" \"$search_directory\""

  eval $_cmd | gsed -e "s/\(:[0-9]\+:\)/\1 /" | awk '{
    r = ""; \
    for (i = 2; i <= NF; ++i) r = r (i == 2 ? "" : " ") gsub(/('"$_keywords"')/, "\x1b[45m&\x1b[0m", $i);\
    $1=""$1" ";\
    print \
  }'
    # $1="\x1b[31m"$1"\x1b[39m\n\t";\
}

setenv-awscredential() {
  local profile=`aws configure list-profiles | peco`
  echo $profile
  export AWS_ACCESS_KEY_ID=`aws --profile $profile configure get aws_access_key_id`
  export AWS_SECRET_ACCESS_KEY=`aws --profile $profile configure get aws_secret_access_key`
}

dotenv() {
  local fp=".env"
  local is_unset=0
  # 引数を受け取った場合は、その引数のファイルを読み込む
  # 引数処理
  while (( $# > 0 )); do
    case $1 in
      -u|--unset)
        is_unset=1
        shift
        ;;
      *)
        fp="$1"
        shift
        ;;
    esac
  done
  if [[ -r "$fp" ]]; then
    while IFS= read -r line; do
      if [[ ! -z $line ]] && [[ ! $line =~ ^# ]]; then
        if (( $is_unset == 0 )); then
          eval "export $line"
        else
          local _v=("${(@s/=/)line}")
          eval "unset $_v[1]"
        fi
      fi
    done < "$fp"
  fi
}

decode-jwt() {
  local token

  if [ -n "$1" ]; then
    token="$1"
  elif [ ! -t 0 ]; then
    token=$(cat)
  else
    echo "Usage: decode-jwt <jwt_token>" >&2
    echo "   or: echo <jwt_token> | decode-jwt" >&2
    return 1
  fi
  if [ -z "$token" ]; then
    echo "Error: JWT token is empty." >&2
    return 1
  fi
  local parts=("${(@s:.:)token}")
  local result="${parts[2]}"
  local len=$((${#result} % 4))
  if [ $len -eq 1 ]; then result="$result"'==='
  elif [ $len -eq 2 ]; then result="$result"'=='
  elif [ $len -eq 3 ]; then result="$result"'='
  fi
  echo "$result" | tr '_-' '/+' | base64 -d | jq .
}

# vim-lsp-settingsのdenoを無効化する設定の作成
create-vls-deno-disabled() {
  mkdir .vim-lsp-settings
  cat << EOF > .vim-lsp-settings/settings.json
{
  "deno": {
    "disabled": true
  }
}
EOF
}

openci() {
  local baseUrl="https://app.circleci.com/pipelines/"
  git rev-parse --is-inside-work-tree > /dev/null || {echo "not git repository"; return 1;}
  git remote get-url origin > /dev/null || {echo "not set origin"; return 1;}
  local repoUrl=`git remote get-url origin | sed "s/github\.com/github/g" | sed "s/\.git//g" | sed "s/git@//g" | sed "s/https:\/\///g"`
  local branch=`git rev-parse --abbrev-ref HEAD | xargs -I{} deno eval --no-lock 'console.log(encodeURIComponent("'{}'".trim()))'`
  open $baseUrl$repoUrl"?branch="$branch
}


# docker コンテナ上でコマンドを実行する
docker-exec() {
  local _container_id=`docker ps --format "{{.Names}}" | peco | xargs -I{} docker ps -a -q -f "name={}"`
  local cmd="bash"
  if [[ $# -ge 1 ]]; then
    cmd=$@
  fi
  docker exec -it $_container_id $cmd
}
alias dexec=docker-exec
alias dx=docker-exec


# composeファイルを検索して一覧として取得します
compose-files-find() {
  find -E * -type f -maxdepth 1 -iregex '^(docker-)?compose.ya?ml$'
}

compose-profiles() {
  compose-files-find | xargs yq e '["default", .services[] | select(.profiles != null) | .profiles[]] | unique | .[]'
}

# composeファイルからサービス一覧を取得します
compose-services() {
  compose-files-find | xargs yq e '.services | keys | .[]'
}

# docker-composeのサービスを起動する
composeup() {
  local services=`compose-services`
  local running_services=`docker compose ps --services | tr '\n' '|' | sed 's/|$//'`
  case $1 in
    --build)
      echo $services | tr ' ' '\n' | grep -vE "^($running_services)$" | peco | xargs docker compose up -d --build
      ;;
    *)
      echo $services | tr ' ' '\n' | grep -vE "^($running_services)$" | peco | xargs docker compose up -d
      ;;
  esac
}
alias cup=composeup


# docker-composeのサービスをprofileを指定して起動する
composeup-profile() {
  local profile=`compose-profiles | peco`
  local option=$([ "$profile" = "default" ] || echo "--profile $profile")
  case $1 in
    --echo)
      echo "docker compose $option up -d --build"
      ;;
    --build)
      eval "docker compose $option up -d --build"
      ;;
    *)
      eval "docker compose $option up -d"
      ;;
  esac
}
alias cupp=composeup-profile


ulidz() {
  code=$(cat << EOF
import * as mod from "jsr:@std/ulid";
console.log(mod.ulid().substring(0,10)+"0".repeat(16))
EOF
)
  deno eval --no-lock $code
}


increment-ulid() {
  code=$(cat << EOF
const ENCODING = '0123456789ABCDEFGHJKMNPQRSTVWXYZ';
const DECODING: { [char: string]: number } = {};

for (let i = 0; i < ENCODING.length; i++) {
  const char = ENCODING[i];
  DECODING[char] = i;
  DECODING[char.toLowerCase()] = i; // Allow lowercase letters
}

function ulidToTimestamp(ulid: string): number {
  if (ulid.length !== 26) {
    throw new Error('Invalid ULID length');
  }
  const timeString = ulid.slice(0, 10);
  let time = BigInt(0);
  for (let i = 0; i < timeString.length; i++) {
    const char = timeString[i];
    const value = DECODING[char];
    if (value === undefined) {
      throw new Error('Invalid character '+char+' in ULID');
    }
    time = (time << BigInt(5)) | BigInt(value);
  }
  return Number(time);
}

function timestampToUlid(timestamp: number): string {
  let time = BigInt(timestamp);
  const timeChars = [];
  for (let i = 0; i < 10; i++) {
    const index = Number(time & BigInt(31));
    timeChars.push(ENCODING[index]);
    time = time >> BigInt(5);
  }
  let timeString = timeChars.reverse().join('');
  timeString = timeString.padStart(10, '0');

  const randomChars = [];
  for (let i = 0; i < 16; i++) {
    const rand = Math.floor(Math.random() * 32);
    randomChars.push(ENCODING[rand]);
  }
  const randomString = randomChars.join('');

  return timeString + randomString;
}
console.log(timestampToUlid(ulidToTimestamp("$1")+1))
EOF
)
  deno eval --no-lock $code
}
