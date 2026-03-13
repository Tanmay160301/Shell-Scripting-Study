#!/usr/bin/env bash

echo "Enter your name"
read name

echo "Hello ${name}, Nice to meet you there "

read -p "Enter your name: " name1
echo "Hello ${name1}, Nice to meet you there "

read -s -p "Enter your password" password
echo "My password is $password"

read -t 5 -p "Enter timed input" timed_input # 5 second thambnar jr kay input nasel tr timeout houn jail
echo "The input is ${timed_input}"