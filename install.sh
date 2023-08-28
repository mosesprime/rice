#!/bin/bash

error(){ printf "### ERROR: %s\\n" "$1" >&2; exit 1; }

warn(){ printf "### WARN: %s\\n" "$1" >&2; }

if (($EUID == 0)); then
    error "Must run script as \$USER"
fi

distro_options=("Debian" "Arch")
PS3="Select your distrobution's base: "
select distro in "${distro_options[@]}"; do
    case $distro in
        "Debian") break;;
        "Arch") break;;
        *) echo "Invalid option.";;
    esac
done

apt_install() {\
    case $distro in
        "Debian") sudo apt install "$@" -y;
    esac
}

pacman_install() {\
    case $distro in
        "Arch") sudo pacman -S "$@" -y;
    esac
}

case $distro in
    "Debian") sudo apt update && sudo apt upgrade -y;;
    "Arch") sudo pacman-mirrors -f5;
	    sudo pacman -Syyu;;
esac

case $distro in
    "Debian") apt_install git build-essential python3 neofetch htop curl wget gzip unzip cmake;;
    "Arch") pacman_install git python3 htop curl wget gzip unzip cmake;;
esac

# set up global git
read -p "### Enter your git username: " git_username
git config --global user.name $git_username
read -p "### Enter your git email: " git_email
git config --global  user.email $git_email

while true; do 
    read -p "### Install TMUX? (y/n) " tmux_yn
    case $tmux_yn in 
        [yY]) apt_install tmux;
            pacman_intsall tmux;
            break;;
        [nN]) warn "Skipping tmux install.";
            break;;
        *) warn "Invalid option."
    esac
done

while true; do
    read -p "### Install the Hack NerdFont? (y/n) " font_yn
    case $font_yn in
        [yY]) wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Hack.zip
            unzip Hack.zip -d ~/.local/share/fonts
            fc-cache -fv
            rm -rf Hack.zip
            break;;
        [nN]) warn "Skipping font install.";
            break;;
        *) warn "Invalid option."
    esac
done
 
# https://www.rust-lang.org/tools/install
while true; do
    read -p "### Install the Rust Toolchain? (y/n) " rust_yn
    case $rust_yn in
        [yY]) curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y;
		    source "$HOME/.cargo/env";
            rustup toolchain install nightly;
            rustup target add wasm32-unknown-unknown wasm32-wasi;
            rustup component add rust-analyzer;
            break;;
        [nN]) warn "Could cause issues if not already installed.";
            break;;
        *) warn "Invalid option.";;
    esac
done

# https://github.com/alacritty/alacritty

# https://github.com/ogham/exa

# https://github.com/neovim/neovim
while true; do
    read -p "### Install & Build the NeoVim editor? (y/n) " neovim_yn
    case $neovim_yn in
        [yY]) apt_install ninja-build gettext cmake unzip curl;
            pacman_install base-devel cmake unzip ninja curl;
            git clone --depth=1 --branch=stable https://github.com/neovim/neovim;
            cd neovim;
            make CMAKE_BUILD_TYPE=Release;
            sudo make install;
            cd ..;
            nvim --version;
            rm -rf neovim;
            break;;
        [nN]) warn "Skipping NeoVim install.";
            break;;
        *) warn "Invalid option.";;
    esac
done

while true; do
    read -p "### Copy the NeoVim configuration? (y/n) " nvim_conf_yn
    case $nvim_conf_yn in 
        [yY]) cp -r ./dotfiles/nvim ~/.config/nvim;
            break;;
        [nN]) break;;
        *) warn "Invalid option.";;
    esac
done

# other
case $distro in
    "Debian") sudo apt autoremove -y;;
esac
