#!/usr/bin/env bash

cleanup(){
    echo "Performing Cleanup..."
    exit 1
}

# Jyaveli aapn ctrl + c dabnar (signal denar) tyaveli ha cleanup cha code run honar
trap cleanup INT

echo "Running..."
sleep 100