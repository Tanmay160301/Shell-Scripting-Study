#!/usr/bin/env bash

# ls /c/Users/Admin/Desktop/Devops_Notes/Linux/Shell_Scripting/Shell-Scripting-Study

source_dir="/c/Users/Admin/Desktop/Devops_Notes/Linux/Shell_Scripting/Shell-Scripting-Study/backup/source-backup-dir"

backup_destination="/c/Users/Admin/Desktop/Devops_Notes/Linux/Shell_Scripting/Shell-Scripting-Study/backup/destination-backup-dir"

# Backup filename with date
# shellcheck disable=SC2276
backup_file="backup_$(date +%Y%m%d%H%M%S).tar.gz"

mkdir -p "${backup_destination}"

tar -czvf "${backup_destination}/${backup_file}" "${source_dir}"

if [ $? -eq 0 ]; then
    echo "Backup is successfull!"
else 
    echo "Failed to create backup"
fi
