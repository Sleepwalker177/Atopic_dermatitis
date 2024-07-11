#!/bin/bash

# define the name of files
file1="NealeLab.tsv"
file2="variants_bp.tsv"
output_file="NealeLab_rsID.tsv"

awk 'BEGIN {FS=OFS="\t"} 
NR==FNR {rsid_map[$2]=$9; next} 
{
  if (FNR == 1) { 
    print $0, "rsid"  # 添加新的列名
  } else {
    rsid = ($2 in rsid_map) ? rsid_map[$2] : "NA"
    print $0, rsid
  }
}' $file2 $file1 > $output_file

head -n 2 $output_file
head -n 2 $file1
tail -n 2 $output_file
tail -n 2 $file1
