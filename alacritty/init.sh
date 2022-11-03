#!/bin/bash
# MaxOS
configFile=$(cd $(dirname $0) && pwd)/alacrity.yaml;
if [ `uname` = "Darwin" ]; then
	echo "mac init";
	configFile=$(cd $(dirname $0) && pwd)/alacrity_darwin.yaml;
fi

configPath=$HOME/.config/alacritty/
mkdir -p $configPath
ln -sf $configFile/alacritty.yml $configPath/alacritty.yml
