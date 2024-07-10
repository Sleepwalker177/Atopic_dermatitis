location="jpt"

for chr in {1..22}; do
	./PLINK/plink1.9 --bfile 1000G_ldsc_jpt_chr/clean.$location.$chr --cm-map PLINK/genetic_map_b37/genetic_map_chr@_combined_b37.txt --make-bed --out 1000G_ldsc_jpt_chr/ref.$location.$chr
done
	
