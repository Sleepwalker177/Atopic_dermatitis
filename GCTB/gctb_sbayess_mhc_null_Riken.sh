#!/bin/bash
gwas_path_UKBB=../1_UKBB/gctb_UKBB_Ashley.ma
gwas_path_NealeLab=../2_NealeLab/gctb_NealeLab.ma
gwas_path_FinnGen=../3_FinnGen/gctb_FinnGen.ma
gwas_path_Riken=../4_Riken/gctb_Riken.ma

# Calling SBayesR
# Exclude MHC loci from calculations by including the option --exclude-mhc
# Overlap option, as the LD matrix reference cohort is the same as GWAS
gctb --sbayes S \
     --mldm ../ldmatrix/eas_hm3_sparse/1000G_eas_sparse_all.mldmlist \
     --gwas-summary $gwas_path_Riken \
     --exclude-mhc \
     --chain-length 10000 \
     --burn-in 2000 \
     --out-freq 10 \
     --overlap \
     --out gctb_Riken_mhc_null_3
