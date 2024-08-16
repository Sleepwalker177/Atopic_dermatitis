#!/bin/bash
# for UKBB
# original heads: "RSID\tEA\tOA\tEAF\tBETA\tSE\tP\tN"
thresholds=("0.001" "0.01" "0.05")

for threshold in "${thresholds[@]}"; do
input_file="UKBB_maf${threshold}.tsv"
output_file="gctb_UKBB_maf${threshold}.ma"
awk -F'\t' 'NR==1 {print "SNP\tA1\tA2\tfreq\tbeta\tse\tp\tN"}' $input_file > $output_file
awk -F'\t' 'NR>1 {print $19"\t"$5"\t"$4"\t"$6"\t"$10"\t"$11"\t"$9"\t"$12}' $input_file >> $output_file

# new heads: SNP\tA1\tA2\tfreq\tbeta\tse\tp\tN
# check the new file
head -n 3 $input_file
head -n 3 $output_file
wc -l $input_file
wc -l $output_file
done
