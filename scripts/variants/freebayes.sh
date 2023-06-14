#!/bin/bash
#$ -V
#$ -cwd
#$ -l m_mem_free=50G
#$ -l tmp_free=100G
#$ -j y
# -t 1-4
#$ -N freebayes


#set -e -o pipefail
#ref=/grid/martienssen/data_nlsas/bberube/maize/TPD/index/GCA_001644905_W22.fna
#sample=merge.bam
#out=merge.vcf

#freebayes -f $ref -i -X -u \
#	--use-best-n-alleles 6 --pooled-continuous \
#	$sample > $out


#Filter SNPs by depth >= 10
vcffilter -f "DP > 9 & NUMALT = 1" merge.vcf > merge.filter.vcf

