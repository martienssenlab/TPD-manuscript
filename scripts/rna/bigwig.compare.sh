# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=2G -pe threads 8
#$-V


multiBigwigSummary bins -b wt.r1.bw wt.r2.bw wt.r3.bw wt.r4.bw wt.r5.bw \
	drive.r1.bw drive.r2.bw drive.r3.bw drive.r4.bw drive.r5.bw \
	--numberOfProcessors 8 --outFileName rna.compare



