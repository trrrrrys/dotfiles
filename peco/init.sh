#!/bin/bash
if type "dirname" > /dev/null 2>&1; then
  basepath=$(cd $(dirname $0) && pwd)
	mkdir -p $HOME/.config/peco
  ln -sf $basepath/config.json $HOME/.config/peco/config.json
fi

