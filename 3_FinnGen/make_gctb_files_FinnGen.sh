#!/bin/bash

# original heads: "#chrom  pos     ref     alt     rsids   nearest_genes   pval    mlogp   beta    sebeta  af_alt  af_alt_cases    af_alt_controls N"
awk -F'\t' 'NR==1 {print "SNP\tA1\tA2\tfreq\tbeta\tse\tp\tN"}' FinnGen.tsv > gctb_FinnGen.ma
awk -F'\t' 'NR>1 {print $5"\t"$4"\t"$3"\t"$11"\t"$9"\t"$10"\t"$7"\t"$14}' FinnGen.tsv >> gctb_FinnGen.ma

# new heads: SNP\tA1\tA2\tfreq\tbeta\tse\tp\tN
# check the new file
head -n 3 FinnGen.tsv
head -n 3 gctb_FinnGen.ma
wc -l FinnGen.tsv
wc -l gctb_FinnGen.ma
