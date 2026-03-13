#!/usr/bin/env bash

echo "Hello world"

name="Tanmay"
age=24

echo "My name is ${name} and my age is ${age}"

echo "========================================"
echo "Addition of 2 numbers"
echo "========================================"

x=1
y=1
sum=$((x+y))
echo "sum : ${sum}"

echo "========================================"
echo "Concatinating 2 Strings"
echo "========================================"

first="Hello"
second="tanmay"

echo "${first} ${second}"

echo "========================================"
echo "Finding Length of  Strings"
echo "========================================"

string="Tanmay"
echo "The length of the string is ${#string}"

# shellcheck disable=SC2006
current_date1=`date`
echo "The current date is ${current_date1}"

current_date2=$(date)
echo "The current date is ${current_date2}"

current_time=$(date +%H:%M:%S)
echo "The current time is ${current_time}"

readonly pi=3.14

# pi=9 we cannot do this

echo "$pi"