# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l tmp_free=100G
#$ -l m_mem_free=4G -pe threads 6
#$-V


Trinity --genome_guided_bam drive.bam --max_memory 50G \
	--genome_guided_max_intron 10000 --CPU 6



