# Alacritty v0.12.0 - Debian
echo "-- Setting Up Alacritty Terminal Emulator --"
sudo apt install cmake gzip pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo build --release
# install terminfo globally ??
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
# ADD desktop entry ??
# install man page
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
# ADD shell completeions ??
