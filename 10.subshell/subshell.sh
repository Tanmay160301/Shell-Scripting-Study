#!/usr/bin/env bash
# A subshell in Linux is a separate instance of the shell process,
#  created to execute commands in isolation from the parent shell
# environment. It's like a mini-shell within the main shell, 
# allowing you to run commands or scripts without directly affecting
#  the parent shell's variables, functions, or other settings
echo "Script started!!"

echo "Current Working Directory is : $(pwd)"
echo "No of lines: $(ls /tmp | wc -l)"

echo "Script ended!!"