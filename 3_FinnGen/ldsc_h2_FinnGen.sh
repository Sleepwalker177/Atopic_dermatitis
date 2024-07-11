#!/bin/bash

source activate ldsc

./ldsc/ldsc.py \
	--h2 FinnGen.sumstats.gz \
	--ref-ld-chr ../1000G_ldsc/1000G_ldsc_fin_chr/fin.@ \
	--out FinnGen_h2_5 \
	--w-ld-chr ../1000G_ldsc/1000G_ldsc_fin_chr/fin.@

./ldsc/ldsc.py \
	--h2 FinnGen.sumstats.gz \
	--ref-ld-chr ../1000G_ldsc/1000G_ldsc_fin_chr/fin.@ \
	--out FinnGen_h2_liability_3 \
	--pop-prev 0.219 \
	--samp-prev 0.03978506438 \
	--w-ld-chr ../1000G_ldsc/1000G_ldsc_fin_chr/fin.@

conda deactivate
