location="jpt"

for chr in {1..22}; do
	./ldsc/ldsc.py --out 1000G_ldsc_jpt_chr/jpt.$chr --ld-wind-cm 1 --bfile 1000G_ldsc_jpt_chr/ref.$location.$chr --l2
done

