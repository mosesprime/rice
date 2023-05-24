#!/bin/sh

echo "-- Installing Dependencies --"
sudo apt-get install ninja-build gettext cmake unzip curl

while true; do
read -p "
Copy this NeoVim configuraion? (y/n) " yn
case $yn in
    [yY] ) echo "-- Copying Configuration --"
        cp -r ./nvim ~/.config
        break;;
    [nN] ) exit;;
    * ) echo "invalid response";;
esac
done

while true; do
read -p "
Build latest stable NeoVim? (y/n) " yn
case $yn in
    [yY] ) echo "-- Pulling Source Code --"
        cd TEMP
        git clone --depth 1 --branch stable https://github.com/neovim/neovim
        cd neovim
        make CMAKE_BUILD_TYPE=Release
        sudo make install
        cd ../..
        break;;
    [nN] ) exit;;
    * ) echo "invalid response";;
esac
done

echo "-- Done --"
nvim --version
