#!/usr/bin/bash

source colours.sh

gpg_create() {
    gpg --full-generate-key
}


gpg_add_key_to_git() {
    echo -en $BIWhite
    echo -e "Please select a key from the list"
    echo 
    echo -en $Color_Off
    gpg --list-secret-keys --keyid-format=long

    read gitkey

    gpg --armour --export $gitkey

    git config --global user.signingkey $gitkey
    git config --global commit.gpgsign true


    echo -en $BIWhite
    echo -e "Add this public key to your github account"
    echo -en $Color_Off
}