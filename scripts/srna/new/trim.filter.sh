# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=4G -pe threads 8
#$-V
#$ -t 1-6

#seqkit split2 -j 8 -p 2 5.fastq.gz


#Trim NextFlex adapters
#Setting minimum length = 23 (15nt insert + 2(4N Adapters)

cutadapt -j 8 -a TGGAATTCTCGGGTGCCAAGG --minimum-length 23 $SGE_TASK_ID.fastq.gz |
cutadapt -j 8 -u 4 -u -4 -o $SGE_TASK_ID.trim1.fastq.gz -

#Filter small RNA files by size
#Change virtual environment
#seqkit seq --max-len 32 --min-len 15 $SGE_TASK_ID.trim1.fastq.gz > $SGE_TASK_ID.trim2.fastq






