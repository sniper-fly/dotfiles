#!/bin/sh
ln -sf "$(pwd)"/vimrc ~/.vimrc
ln -sf "$(pwd)"/zshrc ~/.zshrc
./modules/sync_dpx.sh
