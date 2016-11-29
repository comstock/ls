#!/bin/bash
# 1. Scans specified directory tree.
# 2. Generates a list of targeted files.
# 3. Moves (or copies) all of the files to the specified directory.
#
ACTION="cp"
TARGETDIR="."
FILE_EXT=".jp2"
COMMAND=$ACTION" -v"
#
find . -type f | grep -E ".*jp2$" > filelist.txt
#
while read line
do mv -v $line .
#do $COMMAND" "$line" "$TARGETDIR"
#echo "COMMAND = $COMMAND $line $TARGETDIR"
#echo "FILE_EXT = $FILE_EXT"
#echo "LINE = $line"
done < filelist.txt
echo ""
echo "     ~~~~~ FIN ~~~~~"
#
