# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=4G -pe threads 4
#$-V
#$ -t 1-3

seqkit seq --threads 4 --max-len 25 --min-len 18 wt.leaf.r$SGE_TASK_ID.fastq.gz > wt.leaf.r$SGE_TASK_ID.len.fastq.gz
seqkit seq --threads 4 --max-len 25 --min-len 18 tpd.leaf.r$SGE_TASK_ID.fastq.gz > tpd.leaf.r$SGE_TASK_ID.len.fastq.gz


