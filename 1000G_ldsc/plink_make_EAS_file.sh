# Use SNP list from Riken to extract a new plink files
# ./PLINK/plink1.9 --bfile old --extract ../4_Riken/Riken_snp_list.tsv -- make-bed --out 

location="eas"

for chr in {1..22}; do
	./PLINK/plink2 --make-bed \
	--out 1000G_ldsc_eas_chr/raw.$location.$chr \
	--pgen PLINK/all_phase3_ns.pgen \
	--pvar PLINK/all_phase3_ns.pvar \
	--psam PLINK/phase3_corrected.psam \
	--maf 0.01 \
        --extract ../4_Riken/Riken_snp_list_filter.tsv \
	--snps-only just-acgt \
	--max-alleles 2 \
	--rm-dup exclude-all \
	--exclude PLINK/exclude.snps \
	--chr $chr \
	--keep PLINK/$location.keep
done

