# This script is submitted to UGE using the qsub <your.script> command. 
#!sh
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=35G -pe threads 4
#$-V
#$ -t 1-5

#input=drive.merge.bam


bamCoverage -b wt.r$SGE_TASK_ID.bam \
 --numberOfProcessors 4 \
 --effectiveGenomeSize 2093255169 \
 --binSize 1 \
 --normalizeUsing RPKM \
 --outFileFormat bigwig \
 --outFileName wt.r$SGE_TASK_ID.bw




#bamCoverage -b 304887.$SGE_TASK_ID.filter.bam \
# --numberOfProcessors 2 \
# --effectiveGenomeSize 2093255169 \
# --binSize 1 \
# --filterRNAstrand reverse \
# --normalizeUsing RPKM \
# --outFileFormat bigwig \
# --outFileName 304887.$SGE_TASK_ID.filter.plus.bw


