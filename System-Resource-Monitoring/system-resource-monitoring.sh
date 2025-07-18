#!/usr/bin/env bash

while true; do
    clear #clear the terminal

    echo "System Resource Monitoring"
    echo "==========================="
    
    echo "Display CPU usage"
    top -n 1 -b | grep "Cpu"
    # top is a command to display process information in real time
    # -n 1 -> By default top commands refreshes every 3 seconds to capture system stats
    # We are limiting that to only 1 iteration (so for only first time stats will be shown)
    # -b is batch mode meaning no interactive display just print on terminal or redirect it to file

    echo -e "\nMemory Usage" #with -e, -n will not be treated as plain text
    free -h
    # -h shows in human readable way like it converts bytes to KB, MB, GB


    echo -e "\nDisk space usage"
    df -h 

    sleep 5 #Sleep for 5 seconds so that output will be on terminal for 5 seconds until next iteration

done
