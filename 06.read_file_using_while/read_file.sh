#!/usr/bin/env bash

echo "Script begins"
# test_path="/c/Users/Admin/Desktop/Devops_Notes/Linux/Shell_Scripting/Shell-Scripting-Study/read_file_using_while/test.txt"

while  IFS= read -r line; do
    echo "${line}"
done < ./test.txt
# Here -r means that treat \n as it is instead of new line character

echo "Script ends"