#!/bin/bash

source activate ldsc

./ldsc/ldsc.py \
	--h2 UKBB.sumstats.gz \
	--ref-ld-chr ../1000G_ldsc/1000G_ldsc_eur_chr/eur.@ \
	--out UKBB_h2_1 \
	--w-ld-chr ../1000G_ldsc/1000G_ldsc_eur_chr/eur.@

./ldsc/ldsc.py \
	--h2 UKBB.sumstats.gz \
	--ref-ld-chr ../1000G_ldsc/1000G_ldsc_eur_chr/eur.@ \
	--out UKBB_h2_liability_1 \
	--pop-prev 0.055 \
	--samp-prev 0.075408197 \
	--w-ld-chr ../1000G_ldsc/1000G_ldsc_eur_chr/eur.@

conda deactivate
