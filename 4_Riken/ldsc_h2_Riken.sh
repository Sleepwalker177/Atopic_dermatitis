#!/bin/bash

source activate ldsc

./ldsc/ldsc.py \
	--h2 Riken.sumstats.gz \
	--ref-ld-chr ../1000G_ldsc/1000G_ldsc_jpt_chr/jpt.@ \
	--out Riken_h2_2 \
	--w-ld-chr ../1000G_ldsc/1000G_ldsc_jpt_chr/jpt.@

./ldsc/ldsc.py \
	--h2 Riken.sumstats.gz \
	--ref-ld-chr ../1000G_ldsc/1000G_ldsc_jpt_chr/jpt.@ \
	--out Riken_h2_liability_2 \
	--pop-prev 0.021 \
	--samp-prev 0.01124808994699013375087249335019 \
	--w-ld-chr ../1000G_ldsc/1000G_ldsc_jpt_chr/jpt.@

conda deactivate
