#!/usr/bin/bash

source colours.sh

ssh_create() {
    echo -e "Choose an algorithm for generating key: "
    echo -en $BIWhite
    echo "1 => ED-25519 (default)"
    echo -en $BIBlack
    echo "2 => RSA"
    echo -en "> "

    read algo

    echo -en $BWhite
    if [ -z $algo ] || [ $algo -eq 1 ] ; then

        echo -en $BIWhite
        echo -en "Enter your email: "
        echo -en $BIGreen

        read email

        echo -en $BIWhite

        ssh-keygen -t ed25519 -C $email

    elif [ $algo -eq 2 ]; then
        echo -e "Choose bit length: (default: 4096)"
        read bit_length

        if [ -z $bit_length ]; then
            bit_length=4096
        fi


        echo -en $BIWhite
        echo -en "Enter your email: "
        echo -en $BIGreen

        read email

        echo -en $BIWhite

        ssh-keygen -t rsa -b $bit_length -C $email
    else
        echo -en $BIRed
        echo -e
        echo -e "Invalid choice! Returning back to menu." 
        echo -e
        sleep 0.5
        return
    fi
}

ssh_add_key() {
    echo Starting SSH Agent
    eval $(ssh-agent)
    echo Keyfile to be added: \"$1\"
    echo Confirm? [Y]es/[n]o
    read confirmation
    if [ $confirmation = "n" ]; then
        return
    fi
    ssh-add $1
}
