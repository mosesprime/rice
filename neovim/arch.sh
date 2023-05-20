#!/bin/sh

echo "-- Installing Dependencies --"
sudo pacman -S base-devl cmake unzip ninja curl

while true; do
read -p "Would you like to copy this configuraion? (y/n) " yn
case $yn in
    [yY] ) echo "-- Copying Configuration --"
        cp -r ./nvim ~/.config
        break;;
    [nN] ) exit;;
    * ) echo "invalid response";;
esac
done

while true; do
read -p "Build latest stable NeoVim? (y/n) " yn
case $yn in
    [yY] ) echo "-- Pulling Source Code --"
        git clone --depth 1 --branch stable https://github.com/neovim/neovim
        cd neovim
        make CMAKE_BUILD_TYPE=Release
        sudo make install
        echo "-- Cleaning Up --"
        cd ..
        rm -rf neovim
        break;;
    [nN] ) exit;;
    * ) echo "invalid response";;
esac
done

echo "-- Done --"
nvim --version
