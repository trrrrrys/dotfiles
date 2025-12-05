#!/bin/bash
configFile=$(cd $(dirname $0) && pwd)/alacritty.toml;
# macOS
if [ `uname` = "Darwin" ]; then
	configFile=$(cd $(dirname $0) && pwd)/alacritty_darwin.toml;
fi

configPath=$HOME/.config/alacritty/
mkdir -p $configPath
ln -sf $configFile $configPath/alacritty.toml
