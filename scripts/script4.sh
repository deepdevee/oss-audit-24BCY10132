#!/bin/bash
# Script 4: Log File Analyzer
# Author: Deep Deshmukh | 24BCY10132

# Kali/Debian uses journalctl — find the right log file automatically
if [ -n "$1" ]; then
    LOGFILE="$1"
elif [ -f "/var/log/kern.log" ]; then
    LOGFILE="/var/log/kern.log"
elif [ -f "/var/log/auth.log" ]; then
    LOGFILE="/var/log/auth.log"
elif [ -f "/var/log/dpkg.log" ]; then
    LOGFILE="/var/log/dpkg.log"
else
    echo "Error: No log file found. Please pass one as an argument."
    echo "Usage: ./script4.sh [logfile] [keyword]"
    echo "Example: ./script4.sh /var/log/auth.log error"
    exit 1
fi

KEYWORD="${2:-error}"

# Check file is readable
if [ ! -r "$LOGFILE" ]; then
    echo "Error: Cannot read '$LOGFILE'. Try: sudo ./script4.sh $LOGFILE"
    exit 1
fi

# Count matches
COUNT=$(grep -ic "$KEYWORD" "$LOGFILE" 2>/dev/null)

echo "================================"
echo " Log File Analyzer"
echo "================================"
echo "File    : $LOGFILE"
echo "Keyword : '$KEYWORD'"
echo "Matches : $COUNT"
echo ""
echo "Last 5 matching lines:"
echo "------------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
echo "================================"
