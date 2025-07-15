#!/usr/bin/env bash

fruits=("Apple" "Banana" "Orange" "dates")

for fruit in "${fruits[@]}"; do
    echo "$fruit"
done


# shellcheck disable=SC1073
for fruit in "${fruits[@]}"; do
    echo "The current fruit is ${fruit}"
done

# Concatination
# We can do concatination by directly doing += operator
friends=("Tanmay" "Varad")
friends+=("Viraj" "Yash")

for friend in "${friends[@]}"; do
    echo "Current iteration is : ${friend}"
done

# Deleting a particular friend from friends
echo "After deletion from a particular friend"
unset friends[2]
for friend in "${friends[@]}"; do
    echo "Current iteration is : ${friend}"
done

# After re-adding from a particular friend
friends+=("Viraj")
echo "After re-adding from a particular friend"
for friend in "${friends[@]}"; do
    echo "Current iteration is : ${friend}"
done

# Finding the length of an array is same as finding the length of string
echo "Finding the length of an array"
echo "The length of the array here is ${#friends[@]}"
