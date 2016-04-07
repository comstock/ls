#!/bin/bash
# Runs JPYLYZER JPEG2000 validation software over
# current directory, and produces an XML format
# report for each file.
#
ls -1 *.jp2 | sed -r 's/\.jp2$//g' | sort -n > singleColumnList_JP2s.txt
while read line
do jpylyzer --verbose $line".jp2" > $line".xml"
echo ""
echo $line".jp2"
done < singleColumnList_JP2s.txt
#
rm singleColumnList_JP2s.txt
echo "
     ~~~~~ FIN ~~~~~
"
