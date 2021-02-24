
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
	type ghq peco 1> /dev/null
	if [ $status != 0 ]
		return 1
	end
	set _path 
	# 引数をとった場合はデフォルトでgrepをかける
	if test (count $argv) -ge 1
		set -l cmd "ghq list | grep "
		for item in $argv
			set cmd $cmd" -e "$item
		end 
		set _path $HOME/ghq/(eval $cmd | peco )
	else
	 set _path $HOME/ghq/(ghq list | peco )
	end
	if [ $status = 0 ]
		cd $_path
	end
end
