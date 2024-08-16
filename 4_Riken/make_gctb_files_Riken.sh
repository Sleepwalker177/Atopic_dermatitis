#!/bin/bash
# for Riken
# original heads: "chr     bp      SNPID   Allele1 Allele2 AC_Allele2      AF_Allele2      N       BETA    SE      Tstat   p.value p.value.NA      Is.SPA.convergevarT     varTstar        AF.Cases        AF.Controls     Rsq     MAC     rsid"
thresholds=("0.001" "0.01" "0.05")

for threshold in "${thresholds[@]}"; do
input_file="Riken_maf${threshold}.tsv"
output_file="gctb_Riken_maf${threshold}.ma"
awk -F'\t' 'NR==1 {print "SNP\tA1\tA2\tfreq\tbeta\tse\tp\tN"}' $input_file > $output_file
awk -F'\t' 'NR>1 {print $21"\t"$5"\t"$4"\t"$7"\t"$9"\t"$10"\t"$12"\t"$8}' $input_file >> $output_file

# new heads: SNP\tA1\tA2\tfreq\tbeta\tse\tp\tN
# check the new file
head -n 3 $input_file
head -n 3 $output_file
wc -l $input_file
wc -l $output_file
done
