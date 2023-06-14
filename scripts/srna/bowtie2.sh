#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=3G -pe threads 8
#$-V
#$ -t 1-6


#rrna_ref=/grid/martienssen/data_norepl/bberube/maize/tpd/pareseq/H7WCTBGXG/fastq/index/zm_rrna.bowtie2
rdna_ref=/grid/martienssen/data_norepl/bberube/maize/tpd/pareseq/H7WCTBGXG/fastq/index/zm_rdna.bowtie2

bowtie2 -x $rdna_ref -U $SGE_TASK_ID.rrna.fastq \
 --very-sensitive --threads 8 \
 -S $SGE_TASK_ID.rdna.sam


