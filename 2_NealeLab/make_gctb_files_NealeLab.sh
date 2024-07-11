#!/bin/bash

# original heads: "CHR\tPOS\tREF\tALT\tminor_allele\tminor_AF\texpected_case_minor_AC\tlow_confidence_variant\tn_complete_samples\tAC\tytx\tbeta\tse\ttstat\tpval\trsid"
awk -F'\t' 'NR==1 {print "SNP\tA1\tA2\tfreq\tbeta\tse\tp\tN"}' NealeLab_rsID_2.tsv > gctb_NealeLab.ma
awk -F'\t' 'NR>1 {print $16"\t"$4"\t"$3"\t"$6"\t"$12"\t"$13"\t"$15"\t"$9}' NealeLab_rsID_2.tsv >> gctb_NealeLab.ma

# new heads: SNP\tA1\tA2\tfreq\tbeta\tse\tp\tN
# check the new file
head -n 3 NealeLab_rsID_2.tsv
head -n 3 gctb_NealeLab.ma
wc -l NealeLab_rsID_2.tsv
wc -l gctb_NealeLab.ma
