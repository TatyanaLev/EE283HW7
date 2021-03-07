#!/bin/bash

#SBATCH --job-name=alignRNA           ## Name of the job
#SBATCH -A ecoevo283                  ## account to charge
#SBATCH -p standard                   ## standard partition
#SBATCH -N 1                          ## nodes
#SBATCH --array=1-20                  ## tasks
#SBATCH -c 2                          ## CPUs
#SBATCH -t 1-                         ## day run time limit
#SBATCH --error=slurm-%J.err          ## error log file
#SBATCH --output=slurm-%J.out          ## out log file

module load hisat2/2.2.1 
module load samtools
module load bcftools
module load java
module load picard-tools/1.87
module load gatk

ref="/data/class/ecoevo283/tzhuravl/RAWDATA/ref/dmel-all-chromosome-r6.13.fasta"
path="/data/class/ecoevo283/tzhuravl/RAWDATA/RNAseq/"

cd $path

#take first 10 and last 10 samples (20 files F & R)
##DO BEFORE RUNNING SCRIPT
#ls *_[F].fq.gz | head -10 | sed 's/_F.fq.gz//' > RNAprefixes.txt
#ls *_[F].fq.gz | tail -10 | sed 's/_F.fq.gz//' >> RNAprefixes.txt

file="RNAprefixes.txt"

prefix=`head -n $SLURM_ARRAY_TASK_ID ${file} | tail -n 1`

# alignments

hisat2 -p 2 -x $ref -1 ${prefix}_F.fq.gz -2 ${prefix}_R.fq.gz -S ${prefix}.sam
samtools view -bS ${prefix}.sam - > ${prefix}.bam
samtools sort ${prefix}.bam -o ${prefix}.sorted.bam
samtools index ${prefix}.sorted.bam

# move bams and sams into alignments folder

#mkdir -p alignments
#mv *[bs]a* alignments/
