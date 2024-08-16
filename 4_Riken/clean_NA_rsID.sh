#!/bin/bash

awk -F'\t' '$21 != "NA"' Riken_rsID.tsv > Riken_rsID_cleaned.tsv

# check the number of "NA"
cut -f 21 Riken_rsID.tsv | grep -o 'NA' | wc -l
cut -f 21 Riken_rsID_cleaned.tsv | grep -o 'NA' | wc -l

# check the number of line
wc -l Riken_rsID.tsv
wc -l Riken_rsID_cleaned.tsv
