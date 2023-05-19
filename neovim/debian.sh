#!/bin/sh

sudo apt-get install git build-essentials ninja-build gettext cmake unzip curl
cp ./config ~/.config/nvim
git clone https://github.com/neovim/neovim
cd neovim 
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
