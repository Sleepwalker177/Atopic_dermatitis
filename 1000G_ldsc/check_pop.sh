# Check the categories of populations and their numbers
awk -F'\t' '{print $5}' PLINK/phase3_corrected.psam | sort | uniq -c
