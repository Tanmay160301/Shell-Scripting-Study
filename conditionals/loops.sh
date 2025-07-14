#!/usr/bin/env bash

# For in loop
for item in {1..20}; do
    echo "The item is ${item}"
done

# Space is mandatory here in order to separate fruit items
#Observe comma is not there
fruits=("Apple" "Banana" "Orange" "dates")
# shellcheck disable=SC1073
for fruit in "${fruits[@]}"; do
    echo "The current fruit is ${fruit}"
done

echo "This is while loop"

# While loop 
num=0
while [ ${num} -le 10 ]; do
    # body
    echo "The current iteration for while loop is ${num}"
    num=$((num+1))
done

# Until loop
# An until loop executes until the condition becomes true — i.e.,
#  it keeps running as long as the condition is false.
# Until chi condition true asel tr te run nahi honar
echo "This is Until loop"
num1=0
until [ ${num1} -ge 10 ]; do
    echo "The current iteration for until loop is ${num1}"
    num1=$((num1+1))
done





