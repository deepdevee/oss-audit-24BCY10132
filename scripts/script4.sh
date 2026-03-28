#!/bin/bash
# Script 4: Log File Analyzer
# Author: Deep Deshmukh | 24BCY10132 | Course: Open Source Software
# Usage: ./script4.sh [logfile] [keyword]
# Example: ./script4.sh /var/log/dpkg.log installed

# --- Auto-detect a valid log file if none is given ---
if [ -n "$1" ]; then
    LOGFILE="$1"
elif [ -f "/var/log/kern.log" ]; then
    LOGFILE="/var/log/kern.log"
elif [ -f "/var/log/auth.log" ]; then
    LOGFILE="/var/log/auth.log"
elif [ -f "/var/log/dpkg.log" ]; then
    LOGFILE="/var/log/dpkg.log"
else
    echo "Error: No log file found. Pass one as an argument."
    echo "Usage: ./script4.sh [logfile] [keyword]"
    exit 1
fi

# Default keyword is 'error' if no second argument given
KEYWORD="${2:-error}"

# Counter to track how many matching lines are found
COUNT=0

# --- Check that the file actually exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# --- Check that the file is readable ---
if [ ! -r "$LOGFILE" ]; then
    echo "Error: Cannot read '$LOGFILE'. Try: sudo ./script4.sh $LOGFILE"
    exit 1
fi

# --- Read the file line by line using a while loop ---
# IFS= preserves leading/trailing whitespace in each line
# -r prevents backslash escapes from being interpreted
while IFS= read -r LINE; do
    # Check if the current line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # Increment counter each time keyword is found
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Print summary ---
echo "================================"
echo " Log File Analyzer"
echo "================================"
echo "File    : $LOGFILE"
echo "Keyword : '$KEYWORD'"
echo "Matches : $COUNT"
echo ""

# --- Print last 5 matching lines using grep and tail ---
echo "Last 5 matching lines:"
echo "------------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
echo "================================"
