
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
		commandline ''
		commandline -f repaint
	end
end

function gcdh
	set -l cl (commandline)
	type ghq peco 1> /dev/null
	if [ $status != 0 ]
		return 1
	end
	set -l _path 
	ls -d ~/ghq/*/* | peco | read _path
	if [ $_path ]
		cd $_path
		commandline ''
		commandline -f repaint
	end
end


function ctrlp
	set -l cl (commandline)
	set -l _path
	switch $cl
		case "cd*"
			set -l find_dir ( string replace -r '(cd\\s+)' '' $cl )
			set -l paths ( \
				find \
				$find_dir -type d -name ".git*"	-prune -o \
				-name "node_modules*" -prune -o \
				-type d 2>/dev/null \
			)
			if [ $status = 0 ]
				 string split " " $paths | peco | read _path
			else
				if [ -n $find_dir ] 
					find . -type d -name ".git*"	-prune -o \
						-name "node_modules*" -prune -o \
						-type d 2>/dev/null | peco --query $find_dir | read _path
				else
					find . -type d -name ".git*"	-prune -o \
						-name "node_modules*" -prune -o \
						-type d 2>/dev/null | peco | read _path
				end
			end
		case "*"
			return 0
	end
	if [ $_path ]
		commandline "cd "$_path
		commandline -f repaint
	end
end

function dotenv
	set -l fp .env
	if test (count $argv) -ge 1
		set fp $argv[1]
	end
	if test -r $fp
		for line in (cat $fp)
			eval (echo set -gx (echo $line | sed "s/=/ /g"))
		end
	end
end
