#!/bin/bash
# copy the image technical metadata from source
# TIFF file to a derivative JP2
#
while read line
do exiftool -@ ImageHistory.txt -TagsFromFile $line".tif" $line".jp2"
echo $line
done < singleColumnList_TIFFs.txt
