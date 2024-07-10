#!/bin/bash
# for UKBB
# original heads: "RSID\tEA\tOA\tEAF\tBETA\tSE\tP\tN"
awk -F'\t' 'NR==1 {print "SNP\tA1\tA2\tfreq\tbeta\tse\tp\tN"}' UKBB_Ashley.tsv > gctb_UKBB_Ashley.ma
awk -F'\t' 'NR>1 {print $19"\t"$5"\t"$4"\t"$6"\t"$10"\t"$11"\t"$9"\t"$12}' UKBB_Ashley.tsv >> gctb_UKBB_Ashley.ma

# new heads: SNP\tA1\tA2\tfreq\tbeta\tse\tp\tN
# check the new file
head -n 3 UKBB_Ashley.tsv
head -n 3 gctb_UKBB_Ashley.ma
wc -l UKBB_Ashley.tsv
wc -l gctb_UKBB_Ashley.ma
