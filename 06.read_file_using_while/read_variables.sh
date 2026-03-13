#!/usr/bin/env bash

echo "Script begins"
# test_path="/c/Users/Admin/Desktop/Devops_Notes/Linux/Shell_Scripting/Shell-Scripting-Study/read_file_using_while/test.txt"

while  IFS=',' read -r fruit1 fruit2 fruit3; do
    echo "I love ${fruit1}"
    echo "I love ${fruit2}"
    echo "I love ${fruit3}"
done < ./test2.txt
# Here -r means that treat \n as it is part of string instead of new line character
# In Unix based environments this works fine, here it will print only first line fruits due to line ending different format in windows
echo "Script ends"