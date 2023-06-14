#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=5G -pe threads 4
#$-V
# -t 1-3
#$ -j y

##### Filtering of unmapped portion for realignment to TPD genome #####

#sample=wt.r$SGE_TASK_ID.bam
#out1=wt.r$SGE_TASK_ID.filter.bam
#out2=wt.r$SGE_TASK_ID.unmapped.bam

#sample=merge.bam
#out1=merge.filter.bam
#out2=merge.unmapped.bam

#samtools view -@ 4 -b -h -F 0x4 $sample -o $out1
#samtools view -@ 4 -b -h -f 0x4 $sample -o $out2

#samtools view -@ 4 -b -h -F 0x4 merge.bam -o merge.filter.bam


##### Filtering aligned sRNAs by size class #####
#Converting to fastq 
sample=dcl2T.bam
out=dcl2T.fastq
final=dcl2T.22.fastq.gz

samtools view -@ 4 -h -F 0x4 $sample |
	samtools fastq -@ 4 - > $out

seqkit seq --max-len 22 --min-len 22 $out |
	gzip - > $final


#############

#samtools view -@ 4 -h -F 0x4 wt.bam |
#	samtools fastq -@ 4 - | gzip - > wt.fastq

#samtools view -@ 4 -h -F 0x4 drive.bam |
#        samtools fastq -@ 4 - | gzip - > drive.fastq

#samtools view -@ 4 -h -F 0x4 drive.hairpin.bam -o drive.hairpin.final.bam
#samtools view -@ 4 -h -F 0x4 wt.hairpin.bam -o wt.hairpin.final.bam

