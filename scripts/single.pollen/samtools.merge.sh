#!/bin/bash
#$ -V
#$ -cwd
#$ -l m_mem_free=50G
#$ -l tmp_free=100G
#$ -j y
#$ -N samtools.merge



samtools merge pollen.merge.bam \
	1.bam 2.bam 3.bam 4.bam 5.bam 6.bam 7.bam 8.bam 9.bam 10.bam \
        11.bam 12.bam 13.bam 14.bam 15.bam 16.bam 17.bam 18.bam 19.bam 20.bam \
        21.bam 22.bam 23.bam 24.bam

picard AddOrReplaceReadGroups \
       I=pollen.merge.bam \
       O= pollen.merge.rg.bam \
       RGID=1 \
       RGLB=1 \
       RGPL=ILLUMINA \
       RGPU=1 \
       RGSM=1

