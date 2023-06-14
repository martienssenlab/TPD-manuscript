#!/bin/bash
#$ -V
#$ -cwd
#$ -l m_mem_free=10G
#$ -l tmp_free=100G
#$ -t 1-12
#$ -j y
#$ -N sp.pipe

fastqc S$SGE_TASK_ID\_R1_001.fastq.gz

fastqc S$SGE_TASK_ID\_R2_001.fastq.gz

