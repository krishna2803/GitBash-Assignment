#!/usr/bin/bash

ssh_create() {
    ssh-keygen
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
