#!/usr/bin/env bash

echo "Script started"

sleep 5 & #This means that the script will run in the background
wait # This command will wait until the sleep is completed

echo "Script ended"