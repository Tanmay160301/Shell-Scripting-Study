#!/usr/bin/env bash

global_var="I am global"

function demo_local() {
    local local_var="I am local"
    echo "Inside function:"
    echo "  Global variable: $global_var"
    echo "  Local variable: $local_var"
}

function try_access_local() {
    echo "Inside another function:"
    echo "  Global variable: $global_var"
    echo "  Local variable: $local_var"  # Will be empty or error
}

echo "Before calling functions:"
echo "Global variable: $global_var"
# echo "Local variable: $local_var"  # Uncommenting this will show nothing or error

demo_local
try_access_local