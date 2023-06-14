# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=4.0G -pe threads 4
#$-V

featureCounts \
 wt.leaf.r1.22.bam wt.leaf.r2.22.bam wt.leaf.r3.22.bam \
 tpd.leaf.r1.22.bam tpd.leaf.r2.22.bam tpd.leaf.r3.22.bam \
 wt.pollen.r1.22.bam wt.pollen.r2.22.bam wt.pollen.r3.22.bam \
 tpd.pollen.r1.22.bam tpd.pollen.r2.22.bam tpd.pollen.r3.22.bam \
 -s 0 -T 4 -a Zm00004b.gtf -o srna.leaf.counts



