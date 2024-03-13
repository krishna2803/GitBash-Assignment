#!/usr/bin/bash

source colours.sh
source manage_gpg_keys.sh
source manage_ssh_keys.sh

banner() {
    echo -en $BIRed
    echo "  _  __          __  __                                   ";
    echo " | |/ /___ _   _|  \/  | __ _ _ __   __ _  __ _  ___ _ __ ";
    echo " | ' // _ \ | | | |\/| |/ _\` | '_ \ / _\` |/ _\` |/ _ \ '__|";
    echo " | . \  __/ |_| | |  | | (_| | | | | (_| | (_| |  __/ |   ";
    echo " |_|\_\___|\__, |_|  |_|\__,_|_| |_|\__,_|\__, |\___|_|   ";
    echo "           |___/                          |___/           ";
    echo -en $Color_Off
}

menu() {
    echo -en $BIWhite
    echo What do you want to do?
    echo -en $Color_Off
    
    echo -en $BIYellow
    echo "1 => Create ssh key"
    echo -en $BIGreen
    echo "2 => Add ssh key to ssh agent"
    echo -en $BIBlue
    echo "3 => Create gpg key"
    echo -en $BIPurple
    echo "4 => Add gpg key to git and github"
    echo -en $BIBlack
    echo "0 => Exit"
    echo -en $Color_Off
    echo -en "> "

    read choice
    if [ $choice -eq 1 ]; then
        echo -en $BIYellow
       ssh_create
    elif [ $choice -eq 2 ]; then 
        echo -en $BIGreen
        echo -en "Write the path of the keyfile: "
        read keyfile
        ssh_add_key $keyfile
    elif [ $choice -eq 3 ]; then
        echo -en $BIPurple
        echo -en $BIBlue
        gpg_create
    elif [ $choice -eq 4 ]; then
        
        echo -en $BIPurple

        gpg_add_key_to_git

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
