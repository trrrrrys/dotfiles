#!/usr/bin/env zsh

# プロンプトを更新
update_prompt() {
	# gitブランチ
	local branch
	git rev-parse 2> /dev/null
	if [[ $? -eq 0 ]]; then
		if [[ -n `git status --short 2>/dev/null` ]]; then
			branch="${fg[magenta]}("`git branch --show-current`")${reset_color}"
		else
			branch="${fg[cyan]}("`git branch --show-current`")${reset_color}"
		fi
	fi
  #
	PROMPT="%{${fg[yellow]}%}%n %{${reset_color}%}%{${fg[red]}%}[%~]% %{${reset_color}%} $branch
%{${fg[green]}%}$ %{${reset_color}%}"
}

add-zsh-hook precmd update_prompt
