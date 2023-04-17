#!/usr/bin/env zsh

# プロファイリング
# zmodload zsh/zprof && zprof
export ZSHDIR="${HOME}/.zsh"
# load config
for cf in $(find $(dirname $(readlink -f ~/.zshrc))"/config" -type f -name "*.zsh" | sort);
do
	source $cf;
done

if [[ $SHLVL = 1 ]]; then
	# tmux session name
	SESSIONNAME="trrrrrys"
	tmux has-session -t $SESSIONNAME &> /dev/null
	if [[ $? != 0 ]]; then
		tmux new-session -s $SESSIONNAME -d;
		tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh;
	fi
	tmux a -t $SESSIONNAME;
fi

if ! [[ -z `command -v zprof` ]] ;then
  zprof
fi
