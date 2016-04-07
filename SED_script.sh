#!/bin/bash
# Runs FITS validation software over
# current directory, and produces a
# report for each file.
#
ls -1 *.xml | sed -r 's/\.xml$//g' | sort -n > singleColumnList_XMLs.txt
while read line
do
mv $line.xml $line.input
sed -e 's/\/run\/user\/1000\/gvfs\/smb-share:server=pentos-smb.ad.hcl.harvard.edu,share=digilab/\/GENERIC_SAN_VOL_NAME/g' $line.input > $line.xml
echo ""
echo $line".xml"
done < singleColumnList_XMLs.txt
#
rm singleColumnList_XMLs.txt; rm *input
echo "

     ~~~~~ FIN ~~~~~
"
