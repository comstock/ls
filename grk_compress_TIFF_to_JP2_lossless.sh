#!/bin/bash
# Grok Image Compression JP2 JPEG2000 codec encoder lossless compression
# https://github.com/GrokImageCompression/grok
find . -type f | grep --extended-regexp ".*\.tif$" | sed -E "s/.tif//g" > tiffNameStem.txt
ls -1 *.tif | wc -l | xargs echo "TIFF count: "
while read line
do
#    grk_compress -i $line".tif" -o $line".jp2" -p RLCP -t 1024,1024 -EPH -SOP -OutFor jp2                            
    grk_compress -i $line".tif" -o $line"_lossless.jp2" -p RLCP -t 1024,1024 -EPH -SOP -OutFor jp2
    echo "converting "$line".tif"
done < tiffNameStem.txt
echo "                                                                                                                
     ~~~ FIN ~~~                                                                                                      
"
ls -1 *.jp2 | wc -l | xargs echo "JP2 count: "
