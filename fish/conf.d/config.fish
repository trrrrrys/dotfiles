
set fish_greeting "
      |ヽ､,.-――.､
      |／      .◎ )
 }＼/  ＿       /    < Hello fish
 > <.  ｀ー    .''フ
 }／ヽ､＿＿_.／
     /／"

if [ $SHLVL = 1 ]
	# tmux session name
	set SESSIONNAME trrrrrys
	tmux has-session -t $SESSIONNAME &> /dev/null
	if [ $status != 0 ]
		# create session
		tmux new-session -s $SESSIONNAME -n script -d;
		tmux send-keys -t $SESSIONNAME "~/bin/script" C-m;
		tmux run-shell /home/trrrrrys/.tmux/plugins/tmux-resurrect/scripts/restore.sh;
	end
	tmux a -t $SESSIONNAME;
end

function fish_prompt
	# login user
	printf '%s%s' \
		(set_color yellow) \
		(whoami)
	# pwd
	printf ' %s[%s]' \
		(set_color red) \
		(prompt_pwd)
	# git status
	printf '%s' \
		(set_color cyan) \
		(__fish_git_prompt)
	# input
	printf '\n%s$ ' \
		(set_color green) 
end

# command stack
function push-line
  set cl (commandline)
  commandline -f repaint
  if test -n (string join $cl)
    set -g fish_buffer_stack $cl
    commandline ''
    commandline -f repaint
    function restore_line -e fish_postexec
      commandline $fish_buffer_stack
      functions -e restore_line
      set -e fish_buffer_stack
    end
  end
end
 
function fish_user_key_bindings
	# peco history
	# require oh-my-fish/plugin-peco
	# fisher install oh-my-fish/plugin-peco
	bind \cr 'peco_select_history (commandline -b)'
	# commandline stack
  bind \cq push-line
  bind \cg gcd
end
