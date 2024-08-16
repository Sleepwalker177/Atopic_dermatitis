#!/bin/bash
gwas_path_UKBB=../1_UKBB/gctb_UKBB_Ashley.ma
gwas_path_NealeLab=../2_NealeLab/gctb_NealeLab.ma
gwas_path_FinnGen=../3_FinnGen/gctb_FinnGen.ma
gwas_path_Riken=../4_Riken/gctb_Riken.ma

# Calling SBayesR
gctb --sbayes S \
     --ldm ../ldmatrix/ukbEURu_imp_v3_HM3_n50k_chisq10_sperse/ukbEURu_imp_v3_HM3_n50k.chisq10.ldm.sparse \
     --gwas-summary $gwas_path_UKBB \
     --chain-length 10000 \
     --burn-in 2000 \
     --out-freq 10 \
     --annot ../Functional_genomic_annotations/annot_baseline2.2_21main.tsv \
     --out gctb_UKBB_mhc_annot_2
