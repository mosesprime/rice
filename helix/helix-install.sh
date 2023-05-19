#!/bin/bash

echo "-- Install Helix Editor --"

cd
sudo mkdir -p Repos
cd Repos
git clone https://github.com/helix-editor/helix
cd helix
cargo install --locked --path helix-term
ln -s $PWD/runtime ~/.config/helix/runtime
hx -g fetch
hx -g build
cd