#!/bin/bash

# display uid
echo "Your uid ${UID}"

UID_TO_TEST_FOR='1000'

if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then
    echo "Your UID do not match ${UID_TO_TEST_FOR}"
    exit 1
fi

USER_NAME=$(id -un)

if [[ "${?}" -ne 0 ]]
then
    echo 'id command did not execute successfully'
    exit 1
fi

echo "Your username ${USER_NAME}"

USER_NAME_TO_TEST_FOR='vagrant'

if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]]
then
    echo 'Your username is vagrant'
fi

if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
then
    echo 'Your username is not vagrant'
    exit 1
fi

exit 0