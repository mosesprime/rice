#!/bin/bash

while true; do
    read -p "Enter desired GO version: " target_version
    TARGET_VERSION="go$target_version.linux-amd64"
    read -p "Confirm GO target? $TARGET_VERSION (y/n/c): " confirm 
    TARGET_URL="https://go.dev/dl/$TARGET_VERSION.tar.gz"
    TEMP_DIR="$HOME/.tmp-$TARGET_VERSION.tar.gz";
    case $confirm in 
        [yY]) echo "Downloading $TARGET_URL ...";
            curl -JLo "$TEMP_DIR" --create-dirs "$TARGET_URL";
            echo "Installing GO lang...";
            sudo rm -rf /usr/local/go;
            sudo tar -C /usr/local -xzf "$TEMP_DIR";
            export PATH=$PATH:/usr/local/go/bin;
            echo "Installing GOPLS ...";
            go install golang.org/x/tools/gopls@latest;
            rm "$TEMP_DIR";
            echo "DONE: Add /usr/local/go/bin to PATH enviroment vars!"
            go version;
            break;;
        [nN]) echo ;;
        [cC]) echo "CANCELED";
            break;;
        *) echo "INVALID OPTION";
    esac
done
