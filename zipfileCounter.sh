#!/bin/bash
#
# Generate list of zipfiles
# extract the number of JP2 files w/in each zipfile
# write out restuls as CSV
#

outFILE="zipCounts.csv" #filename (comma) image file count
inFILE="zipfilelist.txt" # list of zipfiles to parse

if [ -f $outFILE ] # If outFile exists from prior run, delete it.
then
rm $outFILE
fi

ls -1 *.zip > $inFILE # generate inFILE
while read line
do zipinfo -2 $line | grep jp2 | wc --lines > tmpCount.txt # Produce JP2 file-count for each zipfile
TMP=$(cat tmpCount.txt) # load JP2 file-count into variable
echo $line","$TMP >> $outFILE
done < $inFILE
