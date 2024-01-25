#!/bin/bash

echo "ripgrep regex search tool"

while true; do 
    read -p "Install ripgrep? (y/n) " ripgrep_yn
    case $ripgrep_yn in 
        [yY]) cargo install ripgrep;
            rg --version;
            break;;
        [nN]) echo "Canceled ripgrep install.";
            break;;
        *) echo "Invalid option.";
    esac
done
