#!/bin/bash

#SBATCH --job-name=alignATAC          ## Name of the job
#SBATCH -A ecoevo283                  ## account to charge
#SBATCH -p standard                   ## standard partition
#SBATCH -N 1                          ## nodes
#SBATCH --array=1-24
                  ## tasks
#SBATCH -c 2                          ## CPUs
#SBATCH -t 1-                         ## day run time limit
#SBATCH --error=slurm-%J.err          ## error log file

module load bwa 
module load samtools
module load bcftools
module load java
module load picard-tools/1.87
module load gatk

ref="/data/class/ecoevo283/tzhuravl/RAWDATA/ref/dmel-all-chromosome-r6.13.fasta"
path="/data/class/ecoevo283/tzhuravl/RAWDATA/ATACseq/"

cd $path

###DO BEFORE RUNNING SCRIPT
#ls *_[F].fq.gz | sed 's/_F.fq.gz//' > ATACprefixes.txt

file="ATACprefixes.txt"

prefix=`head -n $SLURM_ARRAY_TASK_ID ${file} | tail -n 1`
sampleID=`echo $prefix`


# alignments

bwa mem -t 2 -M $ref ${prefix}_F.fq.gz ${prefix}_R.fq.gz | samtools view -bS - > ${prefix}.bam

samtools sort ${prefix}.bam -o ${prefix}.sort.bam

java -jar /opt/apps/picard-tools/1.87/AddOrReplaceReadGroups.jar I=${prefix}.sort.bam O=${prefix}.RG.bam SORT_ORDER=coordinate RGPL=illumina RGPU=D109LACXX RGLB=Lib1 RGID=${sampleID} RGSM=${sampleID} VALIDATION_STRINGENCY=LENIENT

samtools index ${prefix}.RG.bam


# move bams into alignments folder

mkdir -p alignments
mv *ba* alignments/
