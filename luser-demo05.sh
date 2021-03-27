#!/bin/bash

# Generates a list of random passwords

# A random number as a password

PASSWORD="${RANDOM}"
echo "${PASSWORD}"

# Use current unixtime as a password
PASSWORD=$(date +%s)
echo "${PASSWORD}"

# Use current unixtime and nanoseconds as a password
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# sha256 encoded password

PASSWORD=$(date +%s%N${RANDOM} | sha256sum | head -c 8)
echo "${PASSWORD}"

SPECIAL_CHARACTER_LIST="!@#$%^&*()_+"
SPECIAL_CHARACTER=$(echo $SPECIAL_CHARACTER_LIST | fold -w 1 | shuf | head -n 1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"