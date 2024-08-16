# Keep samples from specific population
awk < PLINK/phase3_corrected.psam '($5=="EAS"){print 0, $1}' > PLINK/eas.keep
