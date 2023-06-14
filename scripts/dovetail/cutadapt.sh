#This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=3G -pe threads 32
#$-V
# -t 1-2


cutadapt \
	-j 32 \
	-a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC \
	-A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT \
	-o all.r1.fastq.trim.gz -p all.r2.fastq.trim.gz \
	all.r1.fastq.gz all.r2.fastq.gz




