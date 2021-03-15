#!/bin/bash

# This script creates an account in local system
# You will be prompted for the account name and password

# Ask for user name
read -p 'Enter a username: ' USER_NAME

# Ask for the real name
read -p 'Enter a real name: ' COMMENT

# Ask for the password
read -p 'Enter a password: ' PASSWORD

# Create a user
useradd -c "${COMMENT}" -m ${USER_NAME}

# Set a password for the user
echo "${PASSWORD}" | passwd --stdin ${USER_NAME}

# Force the user to change the password on the first login
passwd -e ${USER_NAME}
