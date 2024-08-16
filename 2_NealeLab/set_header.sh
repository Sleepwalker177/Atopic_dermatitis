#!/bin/bash

# create header

echo -e "CHR\tPOS\tREF\tALT\tminor_allele\tminor_AF\texpected_case_minor_AC\tlow_confidence_variant\tn_complete_samples\tAC\tytx\tbeta\tse\ttstat\tpval\trsid" > NealeLab_rsID2.tsv

tail -n +2 NealeLab_rsID.tsv >> NealeLab_rsID2.tsv

wc -l NealeLab_rsID2.tsv  NealeLab_rsID.tsv
