#!/bin/bash

echo "Bacon is a background rust code checker."

while true; do 
    read -p "Install Bacon? (y/n) " bacon_yn
    case $bacon_yn in 
        [yY]) cargo install --locked bacon;
            break;;
        [nN]) echo "Canceled Bacon install.";
            break;;
        *) echo "Invalid option.";
    esac
done
