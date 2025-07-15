#!/usr/bin/env bash

echo "Starting the script"

filename="somefile.txt"

# Checking the file existence
if [ ! -f ${filename} ]; then
    echo "ERROR: File does not Exists!!"
    exit 1
fi

# This line wont execute as exit 1 madhuch code cha flow thambnar
echo "File exist"