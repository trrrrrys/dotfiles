#!/usr/bin/env zsh

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
# setopt glob
# setopt glob_complete  # globを展開しないで候補の一覧から補完する。
setopt extended_glob  # 拡張globを有効にする。
setopt mark_dirs   # globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける。
setopt numeric_glob_sort  # 辞書順ではなく数字順に並べる。
setopt magic_equal_subst  # コマンドライン引数の --prefix=/usr とか=以降でも補完
setopt always_last_prompt  # 無駄なスクロールを避ける
setopt no_flow_control

setopt IGNOREEOF # ctrl+dでのログアウトを防ぐ

# n秒以上の処理の際にレポートを表示する
REPORTTIME=10

### history 設定
HISTFILE=~/.zsh/.zsh_historyx
HISTSIZE=100000
SAVEHIST=100000
setopt hist_reduce_blanks
setopt hist_save_no_dups

# ### 補完
autoload -Uz compinit
compinit
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*:default' menu select=2
# ### 補完候補に色を付ける。
zstyle ':completion:*' list-colors "di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' insert-tab false
zstyle ':completion:*:sudo:*' command-path $path
zstyle ':completion:*:cd:*' ignore-parents parent pwd

compdef _go go
zstyle ':completion:*:vim:*' completer _files

update_prompt() {
	# gitブランチ
	if git rev-parse 2> /dev/null; then
		branch="${fg[cyan]}("`git rev-parse --abbrev-ref HEAD`"$diff)${reset_color}"
	else 
		branch=""
	fi
	PROMPT="%{${fg[yellow]}%}%n %{${reset_color}%}%{${fg[red]}%}[%~]% %{${reset_color}%} $branch
%{${fg[green]}%}$ %{${reset_color}%}"
}

add-zsh-hook precmd update_prompt
