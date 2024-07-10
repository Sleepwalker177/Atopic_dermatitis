#!/bin/bash
source activate ldsc
location="eur"

for chr in {1..22}; do
	./ldsc/ldsc.py --out 1000G_ldsc_eur_chr/$location.$chr --ld-wind-cm 1 --bfile 1000G_ldsc_eur_chr/ref.$location.$chr --l2
done

source activate ldsc
