#!/usr/bin/env bash

num=8
if [ ${num} -lt 10 ]; then
     # if body
     echo "The number is less than 10"
elif [ ${num} -eq 10 ]; then
     # else if body
     echo "The number is equal to 10"
else
     # else body
     echo "The number is greater than 10"
fi
