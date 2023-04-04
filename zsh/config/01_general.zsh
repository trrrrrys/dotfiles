
setopt no_beep  # 補完候補がないときなどにビープ音を鳴らさない。
setopt no_nomatch # git show HEAD^とかrake foo[bar]とか使いたい
setopt prompt_subst  # PROMPT内で変数展開・コマンド置換・算術演算を実行
setopt transient_rprompt  # コマンド実行後は右プロンプトを消す
setopt hist_ignore_dups   # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_all_dups  # 重複したヒストリは追加しない
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_verify
setopt share_history  # シェルのプロセスごとに履歴を共有
setopt extended_history  # 履歴ファイルに時刻を記録
setopt hist_expand  # 補完時にヒストリを自動的に展開する。
setopt append_history  # 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt auto_cd  # ディレクトリ名だけで移動
setopt auto_list  # 補完候補が複数ある時に、一覧表示
setopt auto_menu  # 補完候補が複数あるときに自動的に一覧表示する
setopt auto_param_slash
setopt list_packed
setopt list_types
setopt no_flow_control
setopt print_eight_bit
setopt pushd_ignore_dups
setopt rec_exact
setopt autoremoveslash
unsetopt list_beep
setopt complete_in_word  # カーソル位置で補完する。
setopt glob
setopt glob_complete  # globを展開しないで候補の一覧から補完する。
setopt extended_glob  # 拡張globを有効にする。
setopt mark_dirs   # globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける。
setopt numeric_glob_sort  # 辞書順ではなく数字順に並べる。
setopt magic_equal_subst  # コマンドライン引数の --prefix=/usr とか=以降でも補完
setopt always_last_prompt  # 無駄なスクロールを避ける

setopt IGNOREEOF # ctrl+dでのログアウトを防ぐ

# n秒以上の処理の際にレポートを表示する
REPORTTIME=3

### history 設定
HISTFILE=~/.zsh_historyx
HISTSIZE=100000
SAVEHIST=100000
setopt hist_reduce_blanks
setopt hist_save_no_dups


autoload history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "^P" history-beginning-search-backward-end
# bindkey "^N" history-beginning-search-forward-end

### 補完
autoload -U compinit; compinit -C

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
### 補完候補に色を付ける。
# export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30"
# if [ -n "$LS_COLORS" ]; then
#     zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# fi
### 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both

### 補完候補
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _history: ヒストリのコマンドも補完候補とする。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
### _expand
#zstyle ':completion:*' completer _oldlist _complete _match _history _ignored _approximate _prefix
zstyle ':completion:*' completer _complete _ignored _oldlist _match _prefix

## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache
## 詳細な情報を使わない
zstyle ':completion:*' verbose no

## sudo の時にコマンドを探すパス
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

zstyle ':completion:*' insert-tab false
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'


### vsc_info 
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '[%b|%a]'

if is-at-least 4.3.10; then
  setopt prompt_subst
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "${fg[magenta]}+"
  zstyle ':vcs_info:git:*' unstagedstr "${fg[yellow]}!"
  zstyle ':vcs_info:git:*' formats "${fg[blue]}%c%u[%b]${reset_color}"
  zstyle ':vcs_info:git:*' actionformats "%c%u[%b|%a]"
fi

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[1]="$vcs_info_msg_0_" && \
	PROMPT="%{${fg[yellow]}%}%n@%m %{${reset_color}%}%{${fg[red]}%}[%~]% %{${reset_color}%} $psvar[1]
%{${fg[green]}%}$ %{${reset_color}%}"
}

add-zsh-hook precmd _update_vcs_info_msg 
zstyle ':vcs_info:bzr:*' use-simple true

### プロンプト設定
COLOR_FG="%{[38;5;220m%}"
COLOR_BG="%{[30;48;5;082m%}"
COLOR_END="%{[0m%}"

# %n: username
# %m: hostname?
# %~
PROMPT="%{${fg[yellow]}%}%n@%m %{${reset_color}%}%{${fg[red]}%}[%~]% %{${reset_color}%} $psvar[1]
%{${fg[green]}%}$ %{${reset_color}%}"
