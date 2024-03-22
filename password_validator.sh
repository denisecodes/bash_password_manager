#!/bin/bash
is_password_valid() {
    password=$1
    if ((${#password} > 7)); then
        echo "password is long enough"
        if echo $password | grep -q '[^A-Za-z0-9]'; then
            echo "password has at least on special char"
            echo "password is valid"
            exit 0
        else
            echo "password has no special char"
            exit 1
        fi
    else
        echo "password is not long enough"
        exit 1
    fi

}

is_password_valid $1