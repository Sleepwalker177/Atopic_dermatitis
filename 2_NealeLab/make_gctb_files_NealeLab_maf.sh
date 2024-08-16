#!/bin/bash
# for NealeLab
# original heads: "CHR\tPOS\tREF\tALT\tminor_allele\tminor_AF\texpected_case_minor_AC\tlow_confidence_variant\tn_complete_samples\tAC\tytx\tbeta\tse\ttstat\tpval\trsid"
thresholds=("0.001" "0.01" "0.05")

for threshold in "${thresholds[@]}"; do
input_file="NealeLab_maf${threshold}.tsv"
output_file="gctb_NealeLab_maf${threshold}.ma"
awk -F'\t' 'NR==1 {print "SNP\tA1\tA2\tfreq\tbeta\tse\tp\tN"}' $input_file > $output_file
awk -F'\t' 'NR>1 {print $16"\t"$4"\t"$3"\t"$6"\t"$12"\t"$13"\t"$15"\t"$9}' $input_file >> $output_file

# new heads: SNP\tA1\tA2\tfreq\tbeta\tse\tp\tN
# check the new file
head -n 3 $input_file
head -n 3 $output_file
wc -l $input_file
wc -l $output_file
done
