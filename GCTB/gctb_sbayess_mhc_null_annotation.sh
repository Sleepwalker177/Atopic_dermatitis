#!/bin/bash
gwas_path_UKBB=../1_UKBB/gctb_UKBB_Ashley.ma
gwas_path_NealeLab=../2_NealeLab/gctb_NealeLab.ma
gwas_path_FinnGen=../3_FinnGen/gctb_FinnGen.ma
gwas_path_Riken=../4_Riken/gctb_Riken.ma

# Exclude MHC loci from calculations by including the option --exclude-mhc
# Calling SBayesR
gctb --sbayes S \
     --mldm ../ldmatrix/ukbEURu_hm3_shrunk_sparse/ukbEURu_hm3_sparse_mldm_list.txt \
     --gwas-summary $gwas_path_UKBB \
     --exclude-mhc \
     --chain-length 10000 \
     --burn-in 2000 \
     --out-freq 10 \
     --annot ../Functional_genomic_annotations/annot_baseline2.2.txt \
     --out gctb_UKBB_mhc_null_annot_1
