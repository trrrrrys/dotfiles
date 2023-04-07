#!/bin/bash
configFile=$(cd $(dirname $0) && pwd)/alacritty.yaml;
# macOS
if [ `uname` = "Darwin" ]; then
	configFile=$(cd $(dirname $0) && pwd)/alacritty_darwin.yml;
fi

configPath=$HOME/.config/alacritty/
mkdir -p $configPath
ln -sf $configFile $configPath/alacritty.yml
