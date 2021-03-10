#!/usr/bin/env Rscript

mytab = read.table("RNAseq384_SampleCoding.txt",header=TRUE)
mytab2 = mytab[,9:12]
mytab3 = mytab2[c(1:10,93:102),]
mytab4 = mytab3[,c(4,1,2)]
if (file.exists("shortRNAseq.names.txt")) {file.remove("shortRNAseq.names.txt")}
for(i in 1:nrow(mytab4)){
	cat("RNAseq/bam/",mytab4$FullSampleName[i],".bam\n",file="shortRNAseq.names.txt",append=TRUE,sep='')
	}
write.table(mytab4,"shortRNAseq.txt")
