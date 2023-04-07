# プロファイリング
# zmodload zsh/zprof && zprof

# load config
for cf in $(find $(dirname $(readlink -f ~/.zshrc))"/config" -type f -name "*");
do
	source $cf;
done

# if [ $SHLVL = 1 ]; then
# 	# tmux session name
# 	SESSIONNAME="trrrrrys"
# 	tmux has-session -t $SESSIONNAME &> /dev/null
# 	if [ $? != 0 ]; then
# 		tmux new-session -s $SESSIONNAME -n script -d;
# 		tmux send-keys -t $SESSIONNAME "~/bin/script" C-m;
# 		tmux run-shell /home/trrrrrys/.tmux/plugins/tmux-resurrect/scripts/restore.sh;
# 	fi
# 	tmux a -t $SESSIONNAME;
# fi

if ! [[ -z `command -v zprof` ]] ;then
  zprof
fi
