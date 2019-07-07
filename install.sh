#!/usr/bin/env bash

set -e

sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get -y install neovim
sudo apt-get -y install python-dev python-pip python3-dev python3-pip
sudo apt-get -y install xclip xsel git
sudo pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
sudo pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple neovim

cd $HOME
if [ -d $HOME/tmp/neovim-config ]; then
  rm -rf $HOME/tmp/neovim-config
fi

git clone git@github.com:halsn/neovim-config ~/tmp/neovim-config
cd $HOME/tmp
mv ./neovim-config $HOME/.config/nvim/
if [ ! -d $HOME/.fonts ]; then
  mkdir $HOME/.fonts
fi
cd $HOME/.config/nvim
cp -r ./fonts/. $HOME/.fonts

fc-cache -fv
nvim +PlugInstall +UpdateRemotePlugins +qa!

set +e
