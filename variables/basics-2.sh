#!/usr/bin/env bash

basic="Hello World"

echo "Double Quotes here: ${basic}"
echo 'Double Quotes here: ${basic}'
echo No Quotes ${basic}
echo "Both Quotes : '${basic}'"

# Escaping characters
special_char="\$"
echo "The special character is : ${special_char}"



