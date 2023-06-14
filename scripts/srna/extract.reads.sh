# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=3G -pe threads 4
#$-V
#$ -t 1-3

#Define prefix id used for files
file1=wt.leaf
file2=tpd.leaf

file3=wt.pollen
file4=tpd.pollen

#Convert BAM alignment into fastq and extract reads of length N (21, 22, 24) for specific analysis
samtools fastq -@ 4 $file1.r$SGE_TASK_ID.bam > $file1.r$SGE_TASK_ID.fastq
samtools fastq -@ 4 $file2.r$SGE_TASK_ID.bam > $file2.r$SGE_TASK_ID.fastq

samtools fastq -@ 4 $file3.r$SGE_TASK_ID.bam > $file3.r$SGE_TASK_ID.fastq
samtools fastq -@ 4 $file4.r$SGE_TASK_ID.bam > $file4.r$SGE_TASK_ID.fastq

#### Filter into 24nt files
#seqkit seq --threads 4 -g --max-len 24 --min-len 24 $file1.r$SGE_TASK_ID.fastq > $file1.r$SGE_TASK_ID.24.fastq
#seqkit seq --threads 4 -g --max-len 24 --min-len 24 $file2.r$SGE_TASK_ID.fastq > $file2.r$SGE_TASK_ID.24.fastq

#### Filter into 22nt files
#seqkit seq --threads 4 -g --max-len 22 --min-len 22 $file1.r$SGE_TASK_ID.fastq > $file1.r$SGE_TASK_ID.22.fastq
#seqkit seq --threads 4 -g --max-len 22 --min-len 22 $file2.r$SGE_TASK_ID.fastq > $file2.r$SGE_TASK_ID.22.fastq

#### Filter into 21nt files
#seqkit seq --threads 4 -g --max-len 21 --min-len 21 $file1.r$SGE_TASK_ID.fastq > $file1.r$SGE_TASK_ID.21.fastq
#seqkit seq --threads 4 -g --max-len 21 --min-len 21 $file2.r$SGE_TASK_ID.fastq > $file2.r$SGE_TASK_ID.21.fastq


