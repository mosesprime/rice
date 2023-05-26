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
        "Arch") error "Work In Progress";;
        *) echo "Invalid option.";;
    esac
done

apt_install() {\
    case $distro in
        "Debian") sudo apt install "$@";
    esac
}

pacman_install() {\
    case $distro in
        "Arch") sudo pacman -Sy "$@";
    esac
}

case $distro in
    "Debian") sudo apt update && sudo apt upgrade -y;;
    "Arch") sudo pacman -Syyu;;
esac

case $distro in
    "Debian") apt_install git build-essential python3 neofetch htop curl wget gzip cmake;;
    "Arch") error "WIP";;
esac

while true; do
    read -p "Install the Hack NerdFont? (y/n) " font_yn
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
    read -p "Install the Rust Toolchain? (y/n) " rust_yn
    case $rust_yn in
        [yY]) curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y;
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
    read -p "Install & Build the NeoVim editor? (y/n) " neovim_yn
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
    read -p "Copy the NeoVim configuration? (y/n) " nvim_conf_yn
    case $nvim_conf_yn in 
        [yY]) cp -r ./dotfiles/nvim ~/.config;
            break;;
        [nN]) break;;
        *) warn "Invalid option.";;
    esac
done


######### WIP

# source Cargo to shell PATH
case $rust_yn in
    [yY]) source "$HOME/.cargo/env";;
esac

# other
case $distro in
    "Debian") sudo apt autoremove -y;;
esac
