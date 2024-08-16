#!/bin/bash
# make a whole list
output=1000G_eas_sparse_all.mldmlist
> $output
for chr in {1..22}; do
ls -l *chr$chr.*.bin | awk '{print $9}'| sort -V >> $output

# check the output files
head -n 2 $output
tail -n 2 $output

done

sed -i 's/\.bin//g; s|^|/localdisk/home/s2511688/Atopic_dermatitis/ldmatrix/eas_hm3_sparse/|' $output
head -n 2 $output
tail -n 2 $output
