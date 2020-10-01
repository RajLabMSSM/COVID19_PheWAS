

loc_2_rsid <- function(DAT){
  mart <- biomaRt::useMart(biomart="ENSEMBL_MART_SNP", host="grch37.ensembl.org",
                           path="/biomart/martservice", dataset="hsapiens_snp") 
  
  biomaRt::getBM(attributes = c('refsnp_id','chrom_start','chrom_end', 'chrom_strand','allele'), filters = c('chr_name','start','end'), values = as.list(DAT$coord_BM), mart = mart)
  
  temp <- biomaRt::getBM(attributes = c('refsnp_id', 'allele', 'chrom_start', 'chrom_strand'),
                         filters = c('chr_name', 'start', 'end'), 
                         values = list(DAT$CHR, DAT$POS, DAT$POS), 
                         mart = mart)
  results <- c()
  results <- rbind(results, temp)
  return(results)
}