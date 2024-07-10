# cohort including: eur, fin, and jpt
location="eur"

for chr in {1..22}; do
	./PLINK/plink2 --make-bed --out 1000G_ldsc_eur_chr/raw.$location.$chr --pgen PLINK/all_phase3_ns.pgen --pvar PLINK/all_phase3_ns.pvar --psam PLINK/phase3_corrected.psam --maf 0.01 --snps-only just-acgt --max-alleles 2 --rm-dup exclude-all --exclude PLINK/exclude.snps --chr $chr --keep PLINK/$location.keep
done

# The .keep file contains a list of sample identifiers for each cohort
