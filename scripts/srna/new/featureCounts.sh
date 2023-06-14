# This script is submitted to UGE using the qsub <your.script> command. 
#!sh
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=3G -pe threads 6
#$-V


featureCounts -M --fraction -T 6 -a Zm00004b.gtf -o wt.pollen.counts wt.22.bam
featureCounts -M --fraction -T 6 -a Zm00004b.gtf -o drive.pollen.counts drive.22.bam


