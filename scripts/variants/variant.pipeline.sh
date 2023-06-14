#!/bin/bash
#$ -V
#$ -cwd
#$ -pe threads 16
#$ -l m_mem_free=5G
#$ -l tmp_free=100G
# -t 1-4
#$ -j y
#$ -N variant.pipe

set -e -o pipefail

#export raw1=S0$SGE_TASK_ID\_S$SGE_TASK_ID\_R1_001.fastq.gz
#export raw2=S0$SGE_TASK_ID\_S$SGE_TASK_ID\_R2_001.fastq.gz
#export threads=${NSLOTS:-$(nproc)}
#export ref=/grid/martienssen/data_nlsas/bberube/maize/TPD/index/bwa-mem2/GCA_001644905_W22.fna
#export outdir=.

#Trim Illumina Adapter Sequences
#cutadapt -j $threads \
#	--nextseq-trim=10 \
#	-a GCGATCGAGGACGGCAGATGTGTATAAGAGACAG -A GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG \
#	-o $SGE_TASK_ID.r1.fastq.gz -p $SGE_TASK_ID.r2.fastq.gz \
#	$raw1 $raw2

#read1=$SGE_TASK_ID.r1.fastq.gz
#read2=$SGE_TASK_ID.r2.fastq.gz

#Aling with bwa-mem2
#Perform quality filtering
#bwa-mem2 mem -t $threads $ref \
#	$read1 $read2 |
#	samtools view -@ $threads -b -h -q 30 -F 0x100 -F 0x800 - |
#	samtools sort -@ $threads - > ${outdir}/$SGE_TASK_ID.bam

#Remove PCR duplicates
#samtools rmdup $SGE_TASK_ID.bam $SGE_TASK_ID.rmdup.bam

#Add sample specific readgroups for merged variant calling
#picard AddOrReplaceReadGroups \
#	I=$SGE_TASK_ID.bam \
#	O=$SGE_TASK_ID.rg.bam \
#	RGID=$SGE_TASK_ID \
#        RGLB=$SGE_TASK_ID \
#        RGPL=ILLUMINA \
#        RGPU=$SGE_TASK_ID \
#        RGSM=$SGE_TASK_ID

#Merge BAM files 
samtools merge -@ 16 pool1.bam 1.bam 2.bam
samtools merge -@ 16 pool2.bam 3.bam 4.bam


