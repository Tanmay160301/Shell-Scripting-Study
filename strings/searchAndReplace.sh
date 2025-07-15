#!/usr/bin/env bash

string="Hello World, Hello tanmay"

search="Hello"
replace="Hi"

result="${string//$search/$replace}"

echo "Previously the string was $string but now the string is $result"