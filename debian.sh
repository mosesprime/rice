#!/bin/bash

# FOR DEBIAN-BASED DISTROS

echo "-- Initialize Automatic Setup & Ricing --"
cd ~
mkdir TEMP
cd TEMP

echo "-- SetUp Packages --"
sudo apt update && sudo apt upgrade -y
sudo apt install git build-essential python3 neofetch htop curl gzip cmake

# https://www.rust-lang.org/tools/install
echo "-- Install Rust Toolchains --"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -- --y
rustup target add wasm32-unknown-unknown wasm32-wasi
rustup component add rust-analyzer

# install & configure NeoVim
sh ./neovim/debian.sh

echo "-- Cleaning Up --"
sudo apt autoremove -y
