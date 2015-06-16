#!/usr/bin/RScript
# script takes one command line argument (ex. Rscript singleRwithcommands.r ACC) 

library(minfi)
arguments <- commandArgs(trailing=T)

cancer <- arguments

firstpath <- paste('/data/nrnb01_nobackup/agross/TCGA_methylation/',cancer, sep= "")
mapping <- paste(firstpath,'/',cancer,'.mappings.csv', sep="")
targets <- read.csv(mapping, as.is = TRUE)
targets$barcode <- file.path(firstpath, targets$barcode)
rgset <- read.450k(targets$barcode, verbose = TRUE)
dp <- detectionP(rgset)
write.csv(dp, paste(cancer,"_dp",".csv",sep=""))
mset <- preprocessQuantile(rgset)
beta <- getBeta(mset)
write.csv(beta, paste(cancer,"_mset",".csv",sep=""))

