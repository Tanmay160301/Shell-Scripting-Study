#!/usr/bin/env bash

# If the script is successfull, it will give 0 else it will give 1

echo "starting script"

ls /non-existent-dir

# $? captures the exit status of the last command. 0 = success, non-zero = failure.
if [ $? -eq 0 ]; then
    echo "Directory exists!!"
else 
    echo "Directory does not exists!!"
fi

echo "Script completed"
