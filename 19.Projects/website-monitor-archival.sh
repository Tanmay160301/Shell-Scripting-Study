#!/usr/bin/env bash

echo "Script begins"

#Log directory where I will store archive

# get yesterdays date
YESTERDAY=$(date -d "yesterday" +"%Y:%m:%d")

# Log Directory
LOG_DIR="${HOME}/website_monitor"

#create a log file based on yesterdays date (Assume our website monitors script has ran yesterday and we need to archive yesterdays log file)
LOG_FILE="${LOG_DIR}/website_monitor_${YESTERDAY}.log"


ARCHIVED_LOG_DIR="${HOME}/website_monitor_archive"

#create an archival file based on yesterdays date (.tar.gz)
ARCHIVED_LOG_FILE="${ARCHIVED_LOG_DIR}/website_monitor_${YESTERDAY}.tar.gz"
# Recording the log after the archival is done
ARCHIVE="$HOME/Archive_history.log"

# If yesterdays log file exists and if it has not been archived yet then archive that file
if [ -f "${LOG_FILE}" ] && [ ! -f "${ARCHIVED_LOG_FILE}" ]; then
    tar -czf "${ARCHIVED_LOG_FILE}" "${LOG_FILE}"
    rm "${LOG_FILE}" # cleanup
    echo "$(date +"%Y:%m:%d") | The log file ${LOG_FILE} has been archived!!" >> "${ARCHIVE}"
else
    echo "Archived has already been done!!"
fi

echo "Script ends"