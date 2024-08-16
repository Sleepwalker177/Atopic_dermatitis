# cohort including: eur, fin, and jpt
location="jpt"

./PLINK/plink2 --make-bed \
	--out 1000G_ldsc_jpt/raw.$location \
	--pgen PLINK/all_phase3_ns.pgen \
	--pvar PLINK/all_phase3_ns.pvar \
	--psam PLINK/phase3_corrected.psam \
	--maf 0.01 \
	--snps-only just-acgt \
	--max-alleles 2 \
	--rm-dup exclude-all \
	--exclude PLINK/exclude.snps \
	--keep PLINK/$location.keep

# The .keep file contains a list of sample identifiers for each cohort
