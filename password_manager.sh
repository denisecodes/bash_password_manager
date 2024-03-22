#!/bin/bash
# == INSTRUCTIONS ==
#
# Purpose: Manage a user's (valid) passwords
#
# Methods:
#   1. Name: __init__
#      Arguments: none
#   2. Name: add
#      Purpose: add a password for a service IF it is valid, otherwise do nothing
#      Arguments: one string representing a service name,
#                 one string representing a password
#      Returns: None
#   3. Name: get_for_service
#      Arguments: one string representing a service name
#      Returns: the password for the given service, or None if none exists
#   4. Name: list_services
#      Arguments: none
#      Returns: a list of all the services for which the user has a password
#
# A reminder of the validity rules:
#   1. A password must be at least 8 characters long
#   2. A password must contain at least one of the following special characters:
#      `!`, `@`, `$`, `%` or `&`
#
# We recommend that you store the passwords in a dictionary, where the keys are
# the service names and the values are the passwords.
#
# Example usage:
#   > password_manager = PasswordManager()
#   > password_manager.add('gmail', '12ab5!678')   # Valid password
#   > password_manager.add('facebook', '$abc1234') # Valid password
#   > password_manager.add('twitter', '12345678')  # Invalid password, so ignored
#   > password_manager.get_for_service('facebook')
#   '$abc1234'
#   > password_manager.get_for_service('not_real')
#   None
#   > password_manager.get_for_service('twitter')
#   None
#   > password_manager.list_services()
#   ['gmail', 'facebook']
#

# == YOUR CODE ==

# create a password file to store password
# ideally encrypt and hash passwords
# store passwords in a table format


password_file="passwords.txt"
aligned_password_file="aligned_passwords.txt"

# Check if the password file exists; if not, create one
if [ -e "$password_file" ]; then
    echo "Password file: ${password_file} already exists."
else
    echo "AccountName Password" > $password_file
fi

align_columns(){
     column -t -s " " $password_file > $aligned_password_file
     mv $aligned_password_file $password_file
}

# check if password is valid
is_password_valid(){
    password=$1
    if ((${#password} > 7)); then
        echo "password is long enough"
        if echo $password | grep -q '[^A-Za-z0-9]'; then
            echo "password has at least on special char"
            echo "password is valid"
        else
            echo "password has no special char"
        fi
    else
        echo "password is not long enough"
    fi

}
# function to add a password
# check if password is valid first
# if so then add to password file
add_password(){
    password=$1
    if is_password_valid $password; then
        read -p "Enter Account Name: " account_name
        echo "${account_name} ${password}" >> $password_file
        align_columns
        echo "Password for ${account_name} account has been added"
    fi
}

add_password "helloworld*"

# function to update a password

# function to delete a password