#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=3G -pe threads 8
#$-V
#$ -t 1-6

#Alignment to rRNA, rDNA, and tRNA sequences to remove structural RNAs prior to small RNA analysis
ref=/grid/martienssen/data_norepl/bberube/maize/tpd/srna.analysis/index/zm.struct.rna.bowtie2

#Alignment to structural RNAs
#Index based on Zea mays rRNA, tRNA sequences + manually curated rRNA loci
#Reads with 0 alignments (-f 0x4) kept and co nverted back to .fastq
bowtie2 -x $ref -U $SGE_TASK_ID.trim1.fastq.gz --very-sensitive --threads 8 |
samtools view -@ 8 -f 0x4 | samtools fastq -@ 8 > $SGE_TASK_ID.filter.fastq








