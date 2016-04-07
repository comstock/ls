#!/bin/bash
# Runs Exiftool validation software over
# current directory, and produces an XML format
# report for each file.
#
ls -1 *.dng | sed -r 's/\.dng$//g' | sort -n > singleColumnList_DNGs.txt
while read line
do exiftool -v $line".dng" > $line"_exiftool.txt"
echo ""
echo $line".dng"
done < singleColumnList_DNGs.txt
#
rm singleColumnList_DNGs.txt
echo "
     ~~~~~ FIN ~~~~~
"
