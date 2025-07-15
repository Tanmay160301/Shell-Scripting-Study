#!/usr/bin/env bash

echo "First Argument: ${1}"
echo "First Argument: ${2}"
echo "First Argument: ${3}"
echo "First Argument: ${4}"
echo "First Argument: ${5}"
# shellcheck disable=SC2145
echo "All Argument as list: ${@}"
echo "All Argument as string: ${*}"
echo "Total Arguments as : ${#}"


# Bash splits the string by default whitespace (space, tab, newline)
# The () syntax stores it as an array
str="First second third"
# shellcheck disable=SC2206
arr=($str)

echo "${arr[0]}"   # First
echo "${arr[1]}"   # second
echo "${arr[2]}"   # third
