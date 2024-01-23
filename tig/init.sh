#!/bin/bash
if type "dirname" > /dev/null 2>&1; then
  basepath=$(cd $(dirname $0) && pwd)
  ln -sf $basepath/.tigrc $HOME/.tigrc
fi

