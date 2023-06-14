#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=15G
#$-V
#$ -j y
# -t 1-6

#Extract aligned reads
#sample=$SGE_TASK_ID.filter.bam
#out=$SGE_TASK_ID.fastq.gz

#samtools view -@ 4 -h -F 0x4 $sample |
#        samtools fastq -@ 4 - | gzip - > $out

#samtools fastq -@ 4 $SGE_TASK_ID.filter.bam | gzip - > $SGE_TASK_ID.fastq.gz

#Calculate read length distribution from aligned reads
for seq in *.fastq.gz
do
zcat $seq | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > ./$seq.txt
done


