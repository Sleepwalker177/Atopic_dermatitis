#!/bin/bash
# chr     bp      SNPID   Allele1 Allele2 AC_Allele2      AF_Allele2      N       BETA    SE      Tstat   p.value p.value.NA      Is.SPA.converge varT  varTstar AF.Cases        AF.Controls     Rsq     MAC     rsid

input="Riken_rsID_cleaned.tsv"
output="Riken_maf_beta.tsv"

awk 'BEGIN {FS="\t"; OFS="\t"}
     NR==1 {print $0, "MAF"} # Add MAF column at the end of the first row
     NR>1 {
         af_alt = $7  # Get af_alt
         maf = af_alt
         beta = $9  # Get beta
         if (af_alt > 0.5) {
             maf = 1 - af_alt  # Calculate MAF
             beta = -beta  # Reverse the sign of beta
         }
         $9 = beta  # Update beta in the row
         print $0, maf  # Add MAF
     }' $input > $output

# Check the file
# Sort from column 21 to column 21 in ascending order
sort -k21,21n $output | head -n 10
# Descending order
sort -k21,21nr $output | head -n 10
