#!/usr/bin/env bash

# If the user who is running this script is not root then exit
if [[ "$EUID" -ne 0 ]]; then
    echo "Please run this script as root"
    exit 1
fi

create_user(){
    echo "Creating a new user here"
    read -rp "Enter new user name: " username
    read -rp "Enter shell for the user: " shell
    shell=${shell:-/bin/bash} #This is parameter expansion in bash
    # If the user does not provide any response then this will set to default /bin/bash
    useradd -m -s ${shell} ${username} && echo "User created successfully" || echo "Failed to create a new user"
    # -m Tells the system to create the user's home directory (e.g., /home/username)
}

modify_user(){
    echo "Modifying the user here"
    echo "Checking if the user is present in the system or not"
    read -rp "Enter the user to be modified" username
    
    # Here id $username will give all the relevant info for the user
    # uid=1001(someuser) gid=1001(someuser) groups=1001(someuser)
    # We are suppressing the stdout and stderr by redirecting to /dev/null
    if id $username $>/dev/null; then
        echo "User exists!"
        echo "1. Change shell"
        echo "2. Rename user"
        read -rp "Enter the choice: " ch
        if [[ $ch == "1" ]]; then
           echo "Choice is to change the shell"
           read -rp "Enter the appropriate shell (/bin/sh, /bin/zsh): " shell
           usermod -s ${shell} ${username} && echo "shell has been modified for the user" || echo "Failed to modify the shell for the user"
        elif [[ $ch == "2" ]]; then
           echo "Renaming the user"
           read -rp "Enter new username" new_user_name
           usermod -l ${new_user_name} ${username}  && echo "Username has been renamed successfully"
        #    https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-rename-linux-users-and-their-home-directory/
           usermod -d /home/${new_user_name} -m username
        #    This will create a new home directory for new_user_name and copy the contents from old homedir to new one
           groupmod -n ${new_user_name} ${username}
           echo "Renaming has been done"
        else
           echo "Invalid Modification choice"
        fi
    else
        echo "Username with that ID does not exists"
    fi
}

echo "🔧 User Management Script"
echo "--------------------------"
echo "1. Create a new user"
echo "2. Modify an existing user"
echo "3. Delete a user"

read -r -p "Choose between 1, 2 or 3" choice

case "${choice}" in
    1)
    echo "User creation script started"
    create_user
    echo "User creation script ended"
    ;;
    2)
    echo "Modifying existing user here"
    modify_user
    echo "User Modification script ended"
    ;;
    3)
        echo "Deleting user here"
    ;;
    *)
        echo "default (none of above)"
    ;;
esac
