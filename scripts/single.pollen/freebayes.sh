#!/bin/bash
#$ -V
#$ -cwd
#$ -l m_mem_free=50G
#$ -l tmp_free=100G
#$ -j y
#$ -N sp.freebayes

set -e -o pipefail
ref=../index/w22.fa

#freebayes -f $ref -p 1 -i -X -u -C 1 \
#	--use-best-n-alleles 6 --no-population-priors \
#	1.bam 2.bam 3.bam 4.bam 5.bam 6.bam 7.bam 8.bam 9.bam 10.bam \
#	11.bam 12.bam 13.bam 14.bam 15.bam 16.bam 17.bam 18.bam 19.bam 20.bam \
#	21.bam 22.bam 23.bam 24.bam \
#	> single.pollen.vcf

#Variant calling for pooled single pollen samples
freebayes -f $ref -p 1 -i -X -u -C 1 \
	--use-best-n-alleles 6 \
	pollen.merge.bam > pollen.merge.vcf
