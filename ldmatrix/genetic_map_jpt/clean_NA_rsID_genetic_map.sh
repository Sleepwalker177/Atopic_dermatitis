#!/bin/bash

for chr in {1..22}; do

awk -F'\t' '$1 != "NA"' /genetic_map_tommo_GRCh37_rsID_chr/genetic_map_tommo_GRCh37_rsID_chr$chr.tsv > /genetic_map_tommo_GRCh37_rsID_chr_cleaned/genetic_map_tommo_GRCh37_rsID_cleaned_chr$chr.tsv

# check the number of "NA"
cut -f 1 /genetic_map_tommo_GRCh37_rsID_chr/genetic_map_tommo_GRCh37_rsID_chr$chr.tsv | grep -o 'NA' | wc -l
cut -f 1 /genetic_map_tommo_GRCh37_rsID_chr_cleaned/genetic_map_tommo_GRCh37_rsID_cleaned_chr$chr.tsv | grep -o 'NA' | wc -l

# check the number of line
wc -l /genetic_map_tommo_GRCh37_rsID_chr/genetic_map_tommo_GRCh37_rsID_chr$chr.tsv
wc -l /genetic_map_tommo_GRCh37_rsID_chr_cleaned/genetic_map_tommo_GRCh37_rsID_cleaned_chr$chr.tsv

done
