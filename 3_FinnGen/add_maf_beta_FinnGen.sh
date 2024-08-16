# #chrom  pos     ref     alt     rsids   nearest_genes   pval    mlogp   beta    sebeta  af_alt  af_alt_cases    af_alt_controls N
#!/bin/bash

input="FinnGen_without_maf.tsv"
output="FinnGen_maf_beta.tsv"

awk 'BEGIN {FS="\t"; OFS="\t"}
     NR==1 {print $0, "MAF"} # Add MAF column at the end of the first row
     NR>1 {
         af_alt = $11  # Get af_alt
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
# Sort from column 15 to column 15 in ascending order
sort -k15,15n $output | head -n 10
# Descending order
sort -k15,15nr $output | head -n 10
