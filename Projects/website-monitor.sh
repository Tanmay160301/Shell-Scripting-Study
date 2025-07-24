#!/usr/bin/env bash

WEBSITE_URL="www.google.com"
LOG_DIR="${HOME}/website_monitor"
mkdir -p "${LOG_DIR}"

TODAY=$(date +"%Y:%m:%d")
LOG_FILE="$LOG_DIR/website_monitor_${TODAY}.log"

RESPONSE=$(curl -s -o /dev/null -A "Mozilla/5.0" -w "%{http_code} %{time_total}" "${WEBSITE_URL}")

# AWK cannot read through variable or stdin
# We have to make some correction
# STATUS_CODE="$(awk "$1" "$RESPONSE")"
# TOTAL_TIME="$(awk "$2" "$RESPONSE")"

# Ithe multiple commands aapn chaining madhe lihyche aahet
# Use single quotes in awk instead of double quotes as "" are considered to be bash variables while processing 

# When writing awk, sed, or any mini-scripting language inside a shell command, use single quotes unless you need to inject Bash variables into it.

STATUS_CODE=$(echo "$RESPONSE" | awk '{print $1}')
TOTAL_TIME=$(echo "$RESPONSE" | awk '{print $2}' )
# read STATUS_CODE TOTAL_TIME <<< "$RESPONSE" This can also be done to take variables directly


TIMESTAMP=$(date +"%Y - %m - %d : %H : %M : %S")

echo "$TIMESTAMP Information for website url: ${WEBSITE_URL}  | Status code : $STATUS_CODE | Total time : $TOTAL_TIME" >> "${LOG_FILE}"