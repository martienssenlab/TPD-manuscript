#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=3G -pe threads 8
#$-V
#$ -t 1-6


BOWTIE2INDEX=/grid/martienssen/data_norepl/bberube/maize/tpd/index/w22_bowtie2
LOG=$SGE_TASK_ID.pare-minimaize-map-log.txt

#---------------------------------------------------------
# Keep version of programs
#---------------------------------------------------------

bowtie2 --version | awk '(NR==1)' >$LOG
samtools --version | awk '(NR==1)' >>$LOG
bedtools --version | awk '(NR==1)' >>$LOG

#---------------------------------------------------------
# Mapping + deduplication
#---------------------------------------------------------

echo $SGE_TASK_ID >>$LOG

bowtie2 -x $BOWTIE2INDEX -U $SGE_TASK_ID.filter.fastq.gz --no-unal --threads 8 2>>$LOG |
samtools view -bF 4 --threads 8 2>>$LOG |
samtools sort --threads 8 2>>$LOG >$SGE_TASK_ID.all.bam

#---------------------------------------------------------
# Bedgraph
#---------------------------------------------------------

READS=$(samtools view -c $SGE_TASK_ID.all.bam)
NORM=$(echo 'scale=9;'1000000/$READS | bc)

genomeCoverageBed -ibam $SGE_TASK_ID.all.bam -bga -5 -scale $NORM -strand + 2>>$LOG |
    sortBed -i - 2>>$LOG >$SGE_TASK_ID.P.bg
genomeCoverageBed -ibam $SGE_TASK_ID.all.bam -bga -5 -scale $NORM -strand - 2>>$LOG |
    sortBed -i - 2>>$LOG >$SGE_TASK_ID.M.bg
