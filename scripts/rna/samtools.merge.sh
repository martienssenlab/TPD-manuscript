# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=2G -pe threads 8
#$-V

samtools merge -@ 4 drive.bam \
	drive.r1.bam drive.r2.bam drive.r3.bam\
	drive.r4.bam drive.r5.bam

samtools sort -@ 8 drive.bam -o drive.sort.bam

