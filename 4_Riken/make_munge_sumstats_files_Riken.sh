#!/bin/bash

source activate ldsc

./ldsc/munge_sumstats.py \
	--out Riken \
	--N 212036 \
	--a1 Allele2 \
	--a2 Allele1 \
	--sumstats Riken_rsID_cleaned.tsv \
	--ignore chr,bp,SNPID,AC_Allele2,AF_Allele2,SE,Tstat,p.value.NA,Is.SPA.convergevarT,varTstar,AF.Cases,AF.Controls,Rsq,MAC

conda deactivate
