#!/usr/bin/env bash

set -x #Prints commands as they are executed
set -e #exits immediately from that point if there is an error while executing

name='Tanmay'
echo "My name is ${name}"
age=24
echo "My age is ${age}"

expression=$((5+5))
echo "Result is ${expression}"

# Introducing an intentional error
ls /non_existent_directory

echo "Script ended"

# $ ./debug.sh
# + set -e
# + name=Tanmay
# + echo 'My name is Tanmay'
# My name is Tanmay
# + age=24
# + echo 'My age is 24'
# My age is 24
# + expression=10
# + echo 'Result is 10'
# Result is 10
# + ls /non_existent_directory
# ls: cannot access '/non_existent_directory': No such file or directory

# Another way to debug is that we can manually introduce print statement for debugging