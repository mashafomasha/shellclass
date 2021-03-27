#!/bin/bash

echo "You executed the script: ${0}"

# display the path
echo "Path: $(dirname ${0})"

# display the filename
echo "Filename: $(basename ${0})"

# display how many arguments are passed
echo "Number of arguments: ${#}"

# make shure al least one user is supplied to the script
NUMBER_OF_PARAMETERS=${#}
if [[ NUMBER_OF_PARAMETERS -lt 1 ]]
then
    echo "Usage: ${0} USER_NAME [USER_NAME] ..."
    exit 1
fi

# generate and display password for each parameter
for USER_NAME in "$@"
do
    PASSWORD=$(date +%s%N | sha256sum | head -c 48)
    echo "${USER_NAME}: ${PASSWORD}"
done