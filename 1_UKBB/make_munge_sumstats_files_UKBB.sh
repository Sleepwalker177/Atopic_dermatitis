#!/bin/bash

source activate ldsc

./ldsc/munge_sumstats.py \
	--out UKBB \
	--a1 EA \
	--a2 OA \
	--sumstats UKBB_Ashley.tsv \
	--ignore SNP,CHR,BP,EAF,HWE_PVALUE_ALL,SQRT_V_STAT,SE,INFO,OR,BETA_95L,BETA_95U,OR_95L,OR_95U,MAF,EMAC

conda deactivate
