# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=4G -pe threads 32
#$ -V

#index=/grid/martienssen/data_nlsas/bberube/maize/TPD/ont/index/GCA_001644905_W22.fna
#sample=tpd.ont.all.fastq.gz
#out=tpd.ont.all.sam

set -e -o pipefail
#Alignment of nanopore reads with minimap2
#minimap2 -t 32 -ax map-ont $index $sample > $out
	#samtools view -@ 32 -b -h - |
	#samtools sort -@ 32 - > $out

#Convert to bam and coordinate sort
#Use samtools version 1.11 or greater - truncated header error for minimap2 + samtools v1.10
#samtools view -@ 32 -b -h tpd.ont.all.sam -o tpd.ont.all.bam
#samtools sort -@ 32 tpd.ont.all.bam > tpd.ont.all.sort.bam

#Filter by alignment class
#Primary alignments
#samtools view -@ 32 -b -h -F 0x100 -F 0x800 tpd.ont.all.sort.bam -o tpd.ont.primary.bam
#samtools view -@ 32 -b -h -f 0x100 tpd.ont.all.sort.bam -o tpd.ont.secondary.bam
#samtools view -@ 32 -b -h -f 0x800 tpd.ont.all.sort.bam -o tpd.ont.supp.bam

#Filter illumina reads for discordant pairs
samtools view -@ 32 -b -h -F 0x2 301056.merge.bam -o 301056.merge.supp.bam





