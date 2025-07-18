#!/usr/bin/env bash

SEARCH_STRING="old string"
NEW_STRING="new string"
FILES_DIR="/path/to/files/directory"

#Perform find and replace using sed

find "$FILES_DIR" -type f -exec sed -i "s/$SEARCH_STRING/$NEW_STRING/g" {} + 

echo "Find and replace complete"

#find command will give output like
# /home/user/documents/
# ├── file1.txt
# ├── file2.txt
# └── notes/
#     ├── file3.txt
#     └── file4.md

# find /home/user/documents -type f
# /home/user/documents/file1.txt
# /home/user/documents/file2.txt
# /home/user/documents/notes/file3.txt
# /home/user/documents/notes/file4.md

# What {} and + is doing
# {} – Placeholder for Found Files
# In find, {} is a placeholder that represents the file(s) that find discovers.
# So if find locates:

# file1.txt
# file2.txt
# file3.txt

# Then this part:
# -exec sed ... {} +
# is replaced with those filenames, like:

# sed -i "s/$SEARCH_STRING/$NEW_STRING/g" file1.txt file2.txt file3.txt

# The + tells find to pass as many files as possible to a single sed command at once.

# This means instead of:

# sed file1.txt
# sed file2.txt
# sed file3.txt
# It runs one efficient command:

# sed file1.txt file2.txt file3.txt
# ➡️ Performance benefit: Much faster and more resource-friendly, especially when working with many files.