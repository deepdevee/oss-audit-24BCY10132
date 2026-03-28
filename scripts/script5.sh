#!/bin/bash
# Script 5: Open Source Manifesto Generator

echo "Answer questions"

read -p "Tool you use daily: " TOOL
read -p "Freedom means: " FREEDOM
read -p "What will you build: " BUILD

DATE=$(date)
OUTPUT="manifesto.txt"

echo "On $DATE, I believe open source tools like $TOOL represent $FREEDOM." > $OUTPUT
echo "I plan to build $BUILD and share it freely with the world." >> $OUTPUT

echo "Manifesto saved to $OUTPUT"
cat $OUTPUT
