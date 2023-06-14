# This script is submitted to UGE using the qsub <your.script> command. 
#!sh
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=10G -pe threads 12
#$-V
# -t 1-9

multiBamSummary bins -b wt.r1.bam wt.r2.bam wt.r3.bam \
	drive.r1.bam drive.r2.bam drive.r3.bam \
	-o wt.drive.compare



