#!/usr/bin/bash

source colours.sh
source manage_gpg_keys.sh
source manage_ssh_keys.sh

banner() {
    echo "  _  __          __  __                                   ";
    echo " | |/ /___ _   _|  \/  | __ _ _ __   __ _  __ _  ___ _ __ ";
    echo " | ' // _ \ | | | |\/| |/ _\` | '_ \ / _\` |/ _\` |/ _ \ '__|";
    echo " | . \  __/ |_| | |  | | (_| | | | | (_| | (_| |  __/ |   ";
    echo " |_|\_\___|\__, |_|  |_|\__,_|_| |_|\__,_|\__, |\___|_|   ";
    echo "           |___/                          |___/           ";
}

menu() {
    echo What do you want to do?
    
    echo "1 => create ssh key"
    echo "2 => add ssh key to ssh agent"
    echo "3 => create gpg key"
    echo "4 => add gpg key to git and github"
    echo "0 => exit"

    read choice
    if [ $choice -eq 1 ]; then
       ssh_create
    elif [ $choice -eq 2 ]; then 
        echo -en "Write the path of the keyfile: "
        read keyfile
        ssh_add_key $keyfile
    elif [ $choice -eq 3 ]; then
        gpg_create
    elif [ $choice -eq 4 ]; then
        echo -e "Please select a key from the list"
        echo 
        gpg --list-secret-keys --keyid-format=long


        read gitkey

        gpg --armour --export $gitkey

        git config --global user.signingkey $gitkey
        git config --global commit.gpgsign true

        echo -e "Add this public key to your github account"

        menu

    elif [ $choice -eq 0 ]; then
        exit
    else
        echo "Please choose a valid option"
        menu
    fi
}

banner
menu
