#!/bin/bash
gwas_path_UKBB=../1_UKBB/gctb_UKBB_Ashley.ma
gwas_path_NealeLab=../2_NealeLab/gctb_NealeLab.ma
gwas_path_FinnGen=../3_FinnGen/gctb_FinnGen.ma
gwas_path_Riken=../4_Riken/gctb_Riken.ma

# Exclude MHC loci from calculations by including the option --exclude-mhc
# Calling SBayesR
gctb --sbayes S \
     --ldm ../ldmatrix/ukbEURu_imp_v3_HM3_n50k_chisq10_sperse/ukbEURu_imp_v3_HM3_n50k.chisq10.ldm.sparse \
     --gwas-summary $gwas_path_NealeLab \
     --exclude-mhc \
     --chain-length 10000 \
     --burn-in 2000 \
     --out-freq 10 \
     --out gctb_NealeLab_mhc_null_fin

gctb --sbayes S \
     --ldm ../ldmatrix/ukbEURu_imp_v3_HM3_n50k_chisq10_sperse/ukbEURu_imp_v3_HM3_n50k.chisq10.ldm.sparse \
     --gwas-summary $gwas_path_NealeLab \
     --chain-length 10000 \
     --burn-in 2000 \
     --out-freq 10 \
     --out gctb_NealeLab_mhc_fin
