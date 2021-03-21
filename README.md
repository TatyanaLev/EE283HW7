# Indexing the reference genome

The _Drosophila melanogaster_ genome version 6 needs to be indexed for the bwa aligner, samtools, GATK, and hisat2.

[script link](https://github.com/TatyanaLev/EE283HW7/blob/main/index_genome.sh)

Result:

```{bash}
(base) [tzhuravl@login-i17:/data/class/ecoevo283/tzhuravl/RAWDATA/ref] $ls -lah
total 683M
drwxrwsr-x 2 tzhuravl class-ecoevo283-ta   19 Mar  4 13:40 .
drwxrwsr-x 6 tzhuravl class-ecoevo283-ta    6 Feb 17 17:24 ..
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 275K Mar  4 13:39 dmel-all-chromosome-r6.13.dict
-rwxrwxr-x 1 tzhuravl class-ecoevo283-ta 140M Feb 17 17:26 dmel-all-chromosome-r6.13.fasta
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta  50M Feb 25 12:54 dmel-all-chromosome-r6.13.fasta.1.ht2
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta  34M Feb 25 12:54 dmel-all-chromosome-r6.13.fasta.2.ht2
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta  22K Feb 25 12:53 dmel-all-chromosome-r6.13.fasta.3.ht2
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta  34M Feb 25 12:53 dmel-all-chromosome-r6.13.fasta.4.ht2
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta  74M Feb 25 12:55 dmel-all-chromosome-r6.13.fasta.5.ht2
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta  35M Feb 25 12:55 dmel-all-chromosome-r6.13.fasta.6.ht2
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta   12 Feb 25 12:53 dmel-all-chromosome-r6.13.fasta.7.ht2
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta    8 Feb 25 12:53 dmel-all-chromosome-r6.13.fasta.8.ht2
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 9.1K Feb 25 03:34 dmel-all-chromosome-r6.13.fasta.amb
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 442K Feb 25 03:34 dmel-all-chromosome-r6.13.fasta.ann
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 138M Feb 25 03:34 dmel-all-chromosome-r6.13.fasta.bwt
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta  69K Feb 25 03:34 dmel-all-chromosome-r6.13.fasta.fai
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta  35M Feb 25 03:34 dmel-all-chromosome-r6.13.fasta.pac
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta  69M Feb 25 03:34 dmel-all-chromosome-r6.13.fasta.sa
-rwxrwxr-x 1 tzhuravl class-ecoevo283-ta  75M Feb 17 17:26 dmel-all-r6.13.gtf
```

# Aligning to the reference genome

## DNA

[script link](https://github.com/TatyanaLev/EE283HW7/blob/main/alignDNA.sh)

Result:

```{bash}
(base) [tzhuravl@login-i17:/data/class/ecoevo283/tzhuravl/RAWDATA/DNAseq/alignments] $ls -lah | head
total 97G
drwxrwsr-x 2 tzhuravl class-ecoevo283-ta   50 Mar  6 20:03 .
drwxrwsr-x 4 tzhuravl class-ecoevo283-ta   30 Mar  9 15:28 ..
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 3.1G Mar  6 19:29 ADL06_1.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 2.2G Mar  6 19:47 ADL06_1.RG.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 546K Mar  6 19:47 ADL06_1.RG.bam.bai
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 2.2G Mar  6 19:39 ADL06_1.sort.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 3.5G Mar  6 19:31 ADL06_2.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 2.5G Mar  6 19:51 ADL06_2.RG.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 547K Mar  6 19:52 ADL06_2.RG.bam.bai
```

## RNA

Only 20 samples were used. [This script](https://github.com/TatyanaLev/EE283HW7/blob/main/subsetRNA.R) subsets the samples from a list.

[Main script link](https://github.com/TatyanaLev/EE283HW7/blob/main/alignRNA.sh)

Result:

```{bash}
(base) [tzhuravl@login-i17:/data/class/ecoevo283/tzhuravl/RAWDATA/RNAseq/alignments] $ls -lah | head
total 8.5G
drwxrwsr-x 2 tzhuravl class-ecoevo283-ta   42 Mar 10 11:32 .
drwxrwsr-x 4 tzhuravl class-ecoevo283-ta  761 Mar 10 11:58 ..
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 320M Mar 10 11:25 21029B0.sorted.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 250K Mar 10 11:26 21029B0.sorted.bam.bai
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 332M Mar 10 11:26 21029E0.sorted.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 243K Mar 10 11:26 21029E0.sorted.bam.bai
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 288M Mar 10 11:25 21148B0.sorted.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 236K Mar 10 11:25 21148B0.sorted.bam.bai
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 417M Mar 10 11:26 21148E0.sorted.bam
```

## ATAC

[script link](https://github.com/TatyanaLev/EE283HW7/blob/main/alignATAC.sh)

Result:

```{bash}
(base) [tzhuravl@login-i17:/data/class/ecoevo283/tzhuravl/RAWDATA/ATACseq/alignments] $ls -lah | head
total 17G
drwxrwsr-x 2 tzhuravl class-ecoevo283-ta   98 Mar 19 21:26 .
drwxrwsr-x 4 tzhuravl class-ecoevo283-ta   53 Mar 19 03:51 ..
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 220M Mar  6 18:48 P004.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 187M Mar  6 18:50 P004.RG.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 252K Mar  6 18:50 P004.RG.bam.bai
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 182M Mar  6 18:49 P004.sort.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 323M Mar  6 18:49 P005.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 268M Mar  6 18:52 P005.RG.bam
-rw-rw-r-- 1 tzhuravl class-ecoevo283-ta 270K Mar  6 18:52 P005.RG.bam.bai
```
