# This script is submitted to UGE using the qsub <your.script> command. 
#!sh
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=10G -pe threads 12
#$-V
# -t 1-9

#Convert bam files to bedgraph track
in=wt.22.bam
out=wt.22.bdg

bamCoverage -b $in \
 --numberOfProcessors 12 \
 --binSize 1 \
 --effectiveGenomeSize 2093255169 \
 --normalizeUsing CPM \
 --outFileFormat bedgraph \
 --outFileName $out










