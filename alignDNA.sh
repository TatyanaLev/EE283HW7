#!/bin/bash

#SBATCH --job-name=alignDNA           ## Name of the job
#SBATCH -A ecoevo283                  ## account to charge
#SBATCH -p standard                   ## standard partition
#SBATCH -N 1                          ## nodes
#SBATCH --array=1-12                  ## tasks
#SBATCH -c 2                          ## CPUs
#SBATCH -t 1-                         ## day run time limit

module load bwa 
module load samtools
module load bcftools
module load java
module load picard-tools/1.87
module load gatk


##############################
## DO BEFORE RUNNING SCRIPT ##
##############################
#ls *_1.fq.gz | sed 's/_1.fq.gz//' > DNAprefixes.txt
#mkdir alignments #inside RAWDATA/DNAseq

ref="/data/class/ecoevo283/tzhuravl/RAWDATA/ref/dmel-all-chromosome-r6.13.fasta"
path="/data/class/ecoevo283/tzhuravl/RAWDATA/DNAseq/alignments/"
file="/data/class/ecoevo283/tzhuravl/RAWDATA/DNAseq/DNAprefixes.txt"

cd $path

prefix=`head -n $SLURM_ARRAY_TASK_ID ${file} | tail -n 1`
sampleID=`echo $prefix | cut -d "_" -f 1`


# alignments

bwa mem -t 2 -M $ref ../${prefix}_1.fq.gz ../${prefix}_2.fq.gz | samtools view -bS - > ${prefix}.bam
samtools sort ${prefix}.bam -o ${prefix}.sort.bam
java -jar /opt/apps/picard-tools/1.87/AddOrReplaceReadGroups.jar I=${prefix}.sort.bam O=${prefix}.RG.bam SORT_ORDER=coordinate RGPL=illumina RGPU=D109LACXX RGLB=Lib1 RGID=${sampleID} RGSM=${sampleID} VALIDATION_STRINGENCY=LENIENT
samtools index ${prefix}.RG.bam
