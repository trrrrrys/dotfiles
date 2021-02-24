
# get current ip address
function cip -d "get current ip address"
	if test (count $argv) -gt 1
		echo "too many args"
		return
	end
	switch $argv[1]
		case "-*"

			curl $argv ifconfig.io
		case "*"
			# default ipv4
			curl -4 -s ifconfig.io
	end
	# ipv6
	# curl -4 -s ifconfig.io
end

# ghq + peco で cd
function gcd
	set -l cl (commandline)
	type ghq peco 1> /dev/null
	if [ $status != 0 ]
		return 1
	end
	set -l _path 
	# 引数をとった場合はデフォルトでgrepをかける
	if test (count $argv) -ge 1
		set -l cmd "ghq list --full-path | grep "
		for item in $argv
			set cmd $cmd" -e "$item
		end 
		 eval $cmd | peco | read _path
	else
		 ghq list --full-path | peco | read _path
	end
	if [ $_path ]
		cd $_path
		commandline $cl
		commandline -f repaint
	end
end
