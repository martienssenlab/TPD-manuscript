#!/bin/bash
#$ -V
#$ -cwd
#$ -pe threads 32
#$ -l m_mem_free=5G
#$ -l tmp_free=100G
#$ -t 1-2
#$ -j y
#$ -N bwa.alignment

#set -e -o pipefail
#
#export read1=301056.$SGE_TASK_ID.R1.fastq.gz
#export read2=301056.$SGE_TASK_ID.R2.fastq.gz
#export threads=${NSLOTS:-$(nproc)}

#Trim Illumina adapters
#cutadapt -j 8 \
#	-a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
#	-o $SGE_TASK_ID.R1.trim.fastq.gz -p $SGE_TASK_ID.R2.trim.fastq.gz \
#	$read1 $read2

#Align with BWA-MEM
ref=Zea_mays.AGPv3.22.dna.toplevel.fa
outdir=.

bwa mem -t 32 $ref \
	$SGE_TASK_ID.R1.trim.fastq.gz $SGE_TASK_ID.R2.trim.fastq.gz |
	samtools sort -@ 32 - > ${outdir}/$SGE_TASK_ID.bam

#bwa aln $ref -t 8 $SGE_TASK_ID.R1.trim.fastq.gz > $SGE_TASK_ID.R1.sai
#bwa aln $ref -t 8 $SGE_TASK_ID.R2.trim.fastq.gz > $SGE_TASK_ID.R2.sai

#bwa sampe $ref $SGE_TASK_ID.R1.sai $SGE_TASK_ID.R2.sai $SGE_TASK_ID.R1.trim.fastq.gz $SGE_TASK_ID.R2.trim.fastq.gz > $SGE_TASK_ID.sam

#bwa mem -t 8 $ref \
#	$SGE_TASK_ID.R1.trim.fastq.gz $SGE_TASK_ID.R2.trim.fastq.gz |
#	samtools view -@ 8 -b -h -q 30 -F 0x100 -F 0x800 - |
#	samtools sort -@ 8 - > ${outdir}/$SGE_TASK_ID.bam
#Remove duplicates
#samtools rmdup ${outdir}/$SGE_TASK_ID.bam ${outdir}/$SGE_TASK_ID.rmdup.bam

#Add sample-specific read groups for pooled variant calling
#picard AddOrReplaceReadGroups \
#	I=$SGE_TASK_ID.rmdup.bam \
#	O=$SGE_TASK_ID.bam \
#	RGID=$SGE_TASK_ID \
#	RGLB=$SGE_TASK_ID \
#	RGPL=ILLUMINA \
#	RGPU=$SGE_TASK_ID \
#	RGSM=$SGE_TASK_ID

