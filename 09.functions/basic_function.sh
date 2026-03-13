#!/usr/bin/env bash

function name () {
    echo "This is my first function"
    echo "$1" # arguments are accessible through $1, $2,...
    echo "${0}"  # Function name
}

name "Argument 1" "Argument 2" "Argument 3" "Argument 4" 

