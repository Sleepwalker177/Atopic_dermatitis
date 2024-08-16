#!/bin/bash
thresholds=("0.001" "0.01" "0.05")

for threshold in "${thresholds[@]}"; do

gwas_path_UKBB=../1_UKBB/gctb_UKBB_maf${threshold}.ma
gwas_path_NealeLab=../2_NealeLab/gctb_NealeLab_maf${threshold}.ma
gwas_path_FinnGen=../3_FinnGen/gctb_FinnGen_maf${threshold}.ma
gwas_path_Riken=../4_Riken/gctb_Riken_maf${threshold}.ma

# Calling SBayesR
gctb --sbayes S \
     --mldm ../ldmatrix/ukbEURu_hm3_shrunk_sparse/ukbEURu_hm3_sparse_mldm_list.txt \
     --gwas-summary $gwas_path_FinnGen \
     --exclude-mhc \
     --chain-length 10000 \
     --burn-in 2000 \
     --out-freq 10 \
     --annot ../Functional_genomic_annotations/annot_baseline2.2_21main.tsv \
     --out gctb_FinnGen_mhc_null_maf${threshold}_annot

# Exclude MHC loci from calculations by including the option --exclude-mhc
gctb --sbayes S \
     --mldm ../ldmatrix/ukbEURu_hm3_shrunk_sparse/ukbEURu_hm3_sparse_mldm_list.txt \
     --gwas-summary $gwas_path_FinnGen \
     --chain-length 10000 \
     --burn-in 2000 \
     --out-freq 10 \
     --annot ../Functional_genomic_annotations/annot_baseline2.2_21main.tsv \
     --out gctb_FinnGen_mhc_maf${threshold}_annot
done
