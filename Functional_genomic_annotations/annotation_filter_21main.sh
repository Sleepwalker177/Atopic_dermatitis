# SNP     Intercept       Coding_UCSC     Coding_UCSC.flanking.500        Conserved_LindbladToh   Conserved_LindbladToh.flanking.500      CTCF_Hoffman      CTCF_Hoffman.flanking.500       DGF_ENCODE      DGF_ENCODE.flanking.500 DHS_peaks_Trynka        DHS_Trynka      DHS_Trynka.flanking.500 Enhancer_Andersson        Enhancer_Andersson.flanking.500 Enhancer_Hoffman        Enhancer_Hoffman.flanking.500   FetalDHS_Trynka FetalDHS_Trynka.flanking.500      H3K27ac_Hnisz   H3K27ac_Hnisz.flanking.500      H3K27ac_PGC2    H3K27ac_PGC2.flanking.500       H3K4me1_peaks_Trynka    H3K4me1_Trynka    H3K4me1_Trynka.flanking.500     H3K4me3_peaks_Trynka    H3K4me3_Trynka  H3K4me3_Trynka.flanking.500     H3K9ac_peaks_Trynka     H3K9ac_Trynka     H3K9ac_Trynka.flanking.500      Intron_UCSC     Intron_UCSC.flanking.500        PromoterFlanking_Hoffman        PromoterFlanking_Hoffman.flanking.500     Promoter_UCSC   Promoter_UCSC.flanking.500      Repressed_Hoffman       Repressed_Hoffman.flanking.500  SuperEnhancer_Hnisz     SuperEnhancer_Hnisz.flanking.500  TFBS_ENCODE     TFBS_ENCODE.flanking.500        Transcr_Hoffman Transcr_Hoffman.flanking.500    TSS_Hoffman     TSS_Hoffman.flanking.500  UTR_3_UCSC      UTR_3_UCSC.flanking.500 UTR_5_UCSC      UTR_5_UCSC.flanking.500 WeakEnhancer_Hoffman    WeakEnhancer_Hoffman.flanking.500 GERP.NS GERP.RSsup4     MAFbin1 MAFbin2 MAFbin3 MAFbin4 MAFbin5 MAFbin6 MAFbin7 MAFbin8 MAFbin9 MAFbin10        MAF_Adj_Predicted_Allele_Age      MAF_Adj_LLD_AFR Recomb_Rate_10kb        Nucleotide_Diversity_10kb       Backgrd_Selection_Stat  CpG_Content_50kb        MAF_Adj_ASMC      GTEx_eQTL_MaxCPP        BLUEPRINT_H3K27acQTL_MaxCPP     BLUEPRINT_H3K4me1QTL_MaxCPP     BLUEPRINT_DNA_methylation_MaxCPP        synonymousnon_synonymous  Conserved_Vertebrate_phastCons46way     Conserved_Vertebrate_phastCons46way.flanking.500        Conserved_Mammal_phastCons46way Conserved_Mammal_phastCons46way.flanking.500      Conserved_Primate_phastCons46way        Conserved_Primate_phastCons46way.flanking.500   BivFlnk BivFlnk.flanking.500      Human_Promoter_Villar   Human_Promoter_Villar.flanking.500      Human_Enhancer_Villar   Human_Enhancer_Villar.flanking.500Ancient_Sequence_Age_Human_Promoter     Ancient_Sequence_Age_Human_Promoter.flanking.500        Ancient_Sequence_Age_Human_Enhancer     Ancient_Sequence_Age_Human_Enhancer.flanking.500  Human_Enhancer_Villar_Species_Enhancer_Count    Human_Promoter_Villar_ExAC      Human_Promoter_Villar_ExAC.flanking.500
#!/bin/bash

# Define the names of the columns to be retained
columns=("SNP" "Intercept" "Coding_UCSC" "Conserved_LindbladToh" "CTCF_Hoffman" "DGF_ENCODE" "DHS_Trynka" "Enhancer_Hoffman" "FetalDHS_Trynka" "H3K27ac_Hnisz" "H3K4me1_Trynka" "H3K4me3_Trynka" "H3K9ac_Trynka" "Intron_UCSC" "Promoter_UCSC" "Repressed_Hoffman" "SuperEnhancer_Hnisz" "TFBS_ENCODE" "Transcr_Hoffman" "TSS_Hoffman" "UTR_3_UCSC" "UTR_5_UCSC" "WeakEnhancer_Hoffman")

awk_script=$(cat << 'EOF'
BEGIN {
    FS = OFS = "\t"
    # Initialise the names of the columns to be retained
    split(columns_list, columns, " ")
}

NR == 1 {
    # Iterate through the table header rows to find the index of the column to keep
    for (i = 1; i <= NF; i++) {
        for (j in columns) {
            if ($i == columns[j]) {
                keep[i] = 1
                header[j] = i
            }
        }
    }
    # Print the columns to be retained in the header row of the table
    for (i in header) {
        printf "%s%s", (i == 1 ? "" : OFS), $header[i]
    }
    print ""
}

NR > 1 {
    # Print the columns to be retained
    for (i in keep) {
        printf "%s%s", (i == 1 ? "" : OFS), $i
    }
    print ""
}
EOF
)

awk -v columns_list="${columns[*]}" "$awk_script" annot_baseline2.2.tsv > annot_baseline2.2_21main.tsv
