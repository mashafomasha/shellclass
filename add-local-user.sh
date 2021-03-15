#!/bin/bash

# Enforces that it be executed with superuser (root) privileges
if [[ "${UID}" != 0 ]]
then
    echo "Please run with sudo or as root"
    exit 1
fi

# Prompts the person who executed the script to enter the username (login),
# the name for person who will be using the account,
# and the initial password for the account.

read -p "Enter the username to create: " LOGIN
read -p "Enter the name of the person or application that will be using this account: " FULL_NAME
read -p "Enter the password to use for the account: " PASSWORD

# Creates a new user on the local system with the input provided by the user
useradd -c "${FULL_NAME}" -m "${LOGIN}"

# Informs the user if the account was not able to be created for some reason. 
# If the account is not created, the script is to return an exit status of 1.

if [[ "${?}" != 0 ]]
then
    echo "Couldn't create account"
    exit 1
fi

echo "Changing password for user ${LOGIN}"
echo "${PASSWORD}" | passwd --stdin ${LOGIN}
passwd -e "${LOGIN}"

# Displays the username, password, and host where the account was created. 
# This way the help desk staff can copy the output of the script in order
# to easily deliver the information to the new account holder.

echo "username = ${LOGIN}"
echo "password = ${PASSWORD}"
echo "hostname = $(hostname)"