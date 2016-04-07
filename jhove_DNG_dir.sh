#!/bin/bash
# Runs Jhove validation software over
# current directory, and produces an XML format
# report for each file.
#
ls -1 *.dng | sed -r 's/\.dng$//g' | sort -n > singleColumnList_DNGs.txt
while read line
do java -jar ~/jhove/bin/JhoveApp.jar -h xml $line".dng" > $line"_jhove.xml"
echo ""
echo $line".dng"
done < singleColumnList_DNGs.txt
#
rm singleColumnList_DNGs.txt
echo "
     ~~~~~ FIN ~~~~~
"
