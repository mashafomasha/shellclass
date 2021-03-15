#!/bin/bash

# print current user uid
echo "${UID}"

# print current user user name
# id -un is the same as whoami
# alternative syntax for variable assignment is `id -un` (the older syntax)
USER_NAME=$(id -un)
echo "${USER_NAME}"

# print is the current user is root or not
if [[ "${UID}" -eq 0 ]]
then
    echo 'You are root'
else
    echo 'You are not root'
fi
