#!/bin/sh

echo "get the latest version of tmux"

sudo apt-get install build-essential libtool libevent-dev libncurses-dev git automake pkg-config -y

echo "clone the repo"
git clone https://github.com/tmux/tmux.git tmux

cd tmux
git fetch --tags
latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout $latestTag

echo "autogen.sh / make / make install"
sh autogen.sh
./configure && make && sudo make install

echo "tmux version..."
tmux -V