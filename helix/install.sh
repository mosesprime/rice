# https://docs.helix-editor.com/install.html
echo "-- Install Helix Editor --"
git clone https://github.com/helix-editor/helix
cd helix
cargo install --locked --path helix-term 
cp -u $PWD/runtime ~/.config/helix/runtime
hx --grammar fetch
hx --grammar build
cd ..
cp -r ./config.toml ~/.config/helix
cp -r ./languages.toml ~/.config/helix
rm -rf helix
