#!/bin/bash
# chr 19-22 has finished

for chr in {1..22}; do
ls -l *chr$chr.*.bin | awk '{print $9}'| sort -V > 1000G_jpt_shrunk_chr$chr.mldmlist
sed -i 's/\.bin//g; s|^|/localdisk/home/s2511688/Atopic_dermatitis/ldmatrix/jpt_hm3_shrunk/|' 1000G_jpt_shrunk_chr$chr.mldmlist

# check the output files
head -n 2 1000G_jpt_shrunk_chr$chr.mldmlist
tail -n 2 1000G_jpt_shrunk_chr$chr.mldmlist

done

