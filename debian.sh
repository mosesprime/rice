#!/bin/bash

# FOR DEBIAN-BASED DISTROS

echo "-- Initialize Automatic Setup & Ricing --"
cd ~
mkdir GitRepos

echo "-- SetUp Packages --"
sudo apt update && sudo apt upgrade -y
sudo apt install git build-essential python3 neofetch htop curl gzip

# https://www.rust-lang.org/tools/install
echo "-- Install Rust Toolchains --"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -- --y
rustup target add wasm32-unknown-unknown wasm32-wasi
rustup component add rust-analyzer

# https://docs.helix-editor.com/install.html
echo "-- Install Helix Editor --"
cd GitRepos
git clone https://github.com/helix-editor/helix
cd helix
cargo install --locked --path helix-term
cp -u $PWD/runtime ~/.config/helix/runtime # copy instead of link?
hx --grammar fetch
hx --grammar build
cd ~

# https://github.com/alacritty/alacritty/blob/master/INSTALL.md
echo "-- Install Alacritty Terminal --"
sudo apt install cmake gzip pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cd GitRepos
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release # supports Wayland and X11
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
# ADD desktop entry ???
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
# ADD shell completions ???

echo "-- Cleaning Up --"
sudo apt autoremove -y