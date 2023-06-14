#!/bin/bash
#$ -V
#$ -cwd
#$ -pe threads 32
#$ -l m_mem_free=4G
#$ -l tmp_free=100G
# -t 1-6

#Alignment to the W22 and TPD genome using ShortStack
ref=/grid/martienssen/data_norepl/bberube/maize/tpd/srna.analysis/index/w22.fa

#Align total sRNA data

#ShortStack -readfile $SGE_TASK_ID.filter.fastq --genomefile $ref \
# --bowtie_cores 16 --sort_mem 5G --mmap u --dicermin 20 --dicermax 24 \
# --bowtie_m all --mismatches 1 --foldsize 1000 --pad 250 --align_only --outdir $SGE_TASK_ID.out

#ref=/grid/martienssen/data_norepl/bberube/maize/tpd/srna.analysis/index/w22.fa

#Align 22nt filtered data
#ShortStack -readfile w22.22.fastq.gz --genomefile $ref \
# --bowtie_cores 32 --sort_mem 5G --mmap u --dicermin 20 --dicermax 24 \
# --bowtie_m all --mismatches 1 --foldsize 1000 --pad 250 --align_only --outdir w22.22.out

#################
# De novo cluster identification using merged BAMs

sample=merge.22.bam
ref=/grid/martienssen/data_norepl/bberube/maize/tpd/srna.analysis/index/w22.fa
out=locus.22.out

ShortStack --bamfile $sample --genomefile $ref \
 --bowtie_cores 32 --sort_mem 5G --mmap u --dicermin 20 --dicermax 24 \
 --bowtie_m all --locifile loci.file.bed -mismatches 1 --foldsize 1000 --pad 250 --outdir $out

################
#Alignment to the teosinte hairpin locus
#sample=drive.hairpin.fastq
#ref=gdsl.fasta
#out=drive.gdsl.out

#ShortStack --readfile $sample --genomefile $ref \
#	--bowtie_cores 16 --sort_mem 5G --mmap u --dicermin 20 --dicermax 24 \
#	--bowtie_m all --mismatches 2 --align_only --foldsize 1000 --pad 250 --outdir $out










#################
#De novo cluster identification using merged BAMs
#Comparison between pollen and leaf for WT and TPD genomes

#sample=wt.leaf.pollen.bam
#ref=../index/w22.fa
#out=wt.leaf.pollen.out

#ShortStack --bamfile $sample --genomefile $ref \
# --bowtie_cores 16 --sort_mem 5G --mmap u --dicermin 20 --dicermax 24 \
# --bowtie_m all --mismatches 1 --foldsize 1000 --pad 250 --outdir $out

#################
# Reanalysis of genic sRNA clusters

#sample=wt.leaf.pollen.bam
#ref=../index/w22.fa
#out=wt.leaf.pollen.out

#ShortStack --bamfile $sample --genomefile $ref \
# --bowtie_cores 16 --sort_mem 5G --mmap u --dicermin 20 --dicermax 24 \
# --bowtie_m all --mismatches 1 --foldsize 1000 --pad 250 --outdir $out







