#!/bin/bash
# Runs FITS validation software over
# current directory, and produces a
# report for each file.
#
ls -1 *.dng | sed -r 's/\.dng$//g' | sort -n > singleColumnList_DNGs.txt
while read line
do ~/fits-0.9.0/fits.sh -xc -i $line".dng" > $line"_fits.xml"
echo ""
echo $line".dng"
done < singleColumnList_DNGs.txt
#
rm singleColumnList_DNGs.txt
echo "
     ~~~~~ FIN ~~~~~
"
