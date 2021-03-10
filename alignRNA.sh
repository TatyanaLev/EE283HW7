#!/bin/bash

#SBATCH --job-name=alignRNA           ## Name of the job
#SBATCH -A ecoevo283                  ## account to charge
#SBATCH -p standard                   ## standard partition
#SBATCH -N 1                          ## nodes
#SBATCH --array=1-20                  ## tasks
#SBATCH -c 2                          ## CPUs
#SBATCH -t 1-                         ## day run time limit

module load hisat2/2.2.1 
module load samtools
module load bcftools
module load java
module load picard-tools/1.87
module load gatk

##############################
## DO BEFORE RUNNING SCRIPT ##
##############################
#take first 10 and last 10 samples (20 files F & R)
#ls *_[F].fq.gz | head -10 | sed 's/_F.fq.gz//' > RNAprefixes.txt
#ls *_[F].fq.gz | tail -10 | sed 's/_F.fq.gz//' >> RNAprefixes.txt
## OR ##
#Rscript ./subsetRNA.R
#cat shortRNAseq.names.txt | sed 's/RNAseq\/bam\///' | sed s'/.bam//' > RNAprefixes.txt 
#mkdir alignments #inside RAWDATA/RNAseq

ref="/data/class/ecoevo283/tzhuravl/RAWDATA/ref/dmel-all-chromosome-r6.13.fasta"
path="/data/class/ecoevo283/tzhuravl/RAWDATA/RNAseq/alignments"
file="/data/class/ecoevo283/tzhuravl/RAWDATA/RNAseq/RNAprefixes.txt"

cd $path

prefix=`head -n $SLURM_ARRAY_TASK_ID ${file} | tail -n 1`

# alignments
hisat2 -p 2 -x $ref -1 ../${prefix}_F.fq.gz -2 ../${prefix}_R.fq.gz | samtools sort -o ${prefix}.sorted.bam
samtools index ${prefix}.sorted.bam
