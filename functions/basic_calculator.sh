#!/usr/bin/env bash

function sum () {
    local num1="${1}"
    local num2="${2}"

    result=$((num1+num2))
    echo "The addition is : ${result}"
    echo "${result}"
}    
function sub () {
    local num1="${1}"
    local num2="${2}"

    result=$((num1-num2))
    echo "${result}"
}
function mul () {
    local num1="${1}"
    local num2="${2}"

    result=$((num1*num2))
    echo "${result}"
}

read -p "Enter two numbers and operation" num1 num2 op

case "${op}" in
    "add")
        net=$(sum ${num1} ${num2})
        echo "The net result is : ${net}"
    ;;
    "sub")
        net=$(sub ${num1} ${num2})
        echo "The net result is : ${net}"
    ;;
    "mul")
        net=$(mul ${num1} ${num2})
        echo "The net result is : ${net}" 
    ;;
    *)
        echo "default (none of above)"
    ;;
esac



