#!/bin/bash
#$ -V
#$ -cwd
#$ -l m_mem_free=20G
#$ -j y
#$ -N bcftools

#Filter single pollen pooled genotype calls by position
#Use gold standard validated SNP set from TPD homozygote sequencing

#Parse validated positions from Tpd1;Tpd2 vcf file
#rep 'DP' 301056.tpd1.hom | grep -w -E 'A|C|T|G' | awk -v OFS='\t' '{print $1,$2}' > tpd.pos.bed
#Remove header line carryover
#sed -i '1d' tpd.pos.bed 

#Intersect vcf files 
#bcftools isec 301056.tpd1.hom.gz pollen.merge.vcf.gz -p out -n =2
bcftools view single.pollen.vcf.gz --regions-file 301056.tpd1.hom.gz -O v -o single.pollen.filter.vcf

