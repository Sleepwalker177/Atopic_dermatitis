#!/bin/bash

source activate ldsc

./ldsc/ldsc.py \
	--h2 NealeLab_rsID_2.sumstats.gz \
	--ref-ld-chr ../1000G_ldsc/1000G_ldsc_eur_chr/eur.@ \
	--out NealeLab_h2_1 \
	--w-ld-chr ../1000G_ldsc/1000G_ldsc_eur_chr/eur.@

./ldsc/ldsc.py \
	--h2 NealeLab_rsID_2.sumstats.gz \
	--ref-ld-chr ../1000G_ldsc/1000G_ldsc_eur_chr/eur.@ \
	--out NealeLab_h2_liability_1 \
	--pop-prev 0.055 \
	--samp-prev 0.02649 \
	--w-ld-chr ../1000G_ldsc/1000G_ldsc_eur_chr/eur.@

conda deactivate
