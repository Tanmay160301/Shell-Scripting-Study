#!/usr/bin/env bash

file_path="/some/path/to/file"

if [ -f "$file_path" ]; then
    echo "File exists on path ${file_path}"
else 
    echo "File does not exists"
fi
