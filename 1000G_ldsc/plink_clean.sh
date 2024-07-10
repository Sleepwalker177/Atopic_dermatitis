location="eur"

for chr in {1..22}; do
        awk '(NR==FNR){arr[$1]=$5"_"$6;ars[$1]=$4;next}{$1=$2;$2=arr[$1];$5=ars[$1];print $0}' PLINK/phase3_corrected.psam 1000G_ldsc_eur_chr/raw.$location.$chr.fam > 1000G_ldsc_eur_chr/clean.$location.$chr.fam
	cp 1000G_ldsc_eur_chr/raw.$location.$chr.bim 1000G_ldsc_eur_chr/clean.$location.$chr.bim
	cp 1000G_ldsc_eur_chr/raw.$location.$chr.bed 1000G_ldsc_eur_chr/clean.$location.$chr.bed
done

