
# wslのみ実行
which wsl.exe &> /dev/null
if [ $status = 0 ]
	set -x DISPLAY (ip route | grep 'default via' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'):0
	alias pbpaste="xsel --clipboard --output"
	alias pbcopy="xsel --clipboard --input"
end
