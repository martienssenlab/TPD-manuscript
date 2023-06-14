#This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=5G -pe threads 4
#$-V
# -t 1-6



#samtools view -f 0x4 $SGE_TASK_ID.rdna.sam -o $SGE_TASK_ID.rdna.unmapped.sam


#samtools fastq -@ 4 $SGE_TASK_ID.rdna.unmapped.sam > $SGE_TASK_ID.rdna.fastq

samtools fastq -@ 4 301056.1.bam > 301056.1.fastq
samtools fastq -@ 4 301056.2.bam > 301056.2.fastq

