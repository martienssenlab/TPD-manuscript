# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=2G -pe threads 4
#$-V

samtools merge -@ 4 wt.merge.bam \
 wt.leaf.r1.bam wt.leaf.r2.bam wt.leaf.r3.bam \
 wt.pollen.r1.bam wt.pollen.r2.bam wt.pollen.r3.bam

samtools merge -@ 4 tpd.merge.bam \
 tpd.leaf.r1.bam tpd.leaf.r2.bam tpd.leaf.r3.bam \
 tpd.pollen.r1.bam tpd.pollen.r2.bam tpd.pollen.r3.bam


