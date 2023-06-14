#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=3G -pe threads 8
#$-V
#$ -t 1-6



#Trim NextFlex adapters
#Setting minimum length = 23 (15nt insert + 2(4N Adapters)

cutadapt -j 8 -a TGGAATTCTCGGGTGCCAAGG --minimum-length 23 $SGE_TASK_ID.fastq.gz |
cutadapt -j 8 -u 4 -u -4 -o $SGE_TASK_ID.trim1.fastq.gz -

#Filter reads by size (15nt - 32nt commmonly used in sRNA publications)
#Can be used to separate siRNA and other 'small RNAs' as well
seqkit seq --max-len 32 --min-len 15 $SGE_TASK_ID.trim1.fastq.gz > $SGE_TASK_ID.trim2.fastq

#Alignment to rRNA, rDNA, and tRNA sequences to remove structural RNAs prior to small RNA analysis
ref=index/zm.struct.rna.bowtie2

bowtie2 -x $ref -U $SGE_TASK_ID.trim2.fastq.gz --very-sensitive --threads 8 |
samtools view -@ 8 -f 0x4 | samtools fastq -@ 8 > $SGE_TASK_ID.fastq

#Basic alignment + De novo cluster identification using ShortStack
sample=$SGE_TASK_ID.fastq.gz
ref=../index/w22.fa
out=$SGE_TASK_ID.out

ShortStack --readfile $sample --genomefile $ref \
 --bowtie_cores 8 --sort_mem 5G --mmap u --dicermin 20 --dicermax 24 \
 --bowtie_m all --mismatches 1 --foldsize 1000 --pad 250 --outdir $out


#Also very convenient to rerun on merged bam files
#If you keep track of read group/sample ID in the BAM header all data per replicate will be retained
#Spits out a featureCounts like table for DE analysis plus annotation files with metrics like size class, strandednes, etc to make sure they are real loci
sample=wt.leaf.pollen.bam
ref=../index/w22.fa
out=wt.leaf.pollen.out

ShortStack --bamfile $sample --genomefile $ref \
 --bowtie_cores 8 --sort_mem 5G --mmap u --dicermin 20 --dicermax 24 \
 --bowtie_m all --mismatches 1 --foldsize 1000 --pad 250 --outdir $out

#### Post-processing + other stuff ####

#Filter total alignment files by size class (if you want to look only at 21, 22, etc...)
#Converting to fastq.gz
sample=wt.bam
out=wt.fastq.gz
final=wt.22.fastq.gz

samtools view -@ 4 -h -F 0x4 $sample |
        samtools fastq -@ 4 - | gzip - > $out

seqkit seq --max-len 22 --min-len 22 $out |
        gzip - > $final


#Extract aligned reads and calculate size distribution
#Gives a csv with nt size and total counts (Must RPM normalize after with bash/R)
#Input is fastq.gz file of primary alignments (extracted from BAM file as above)

for seq in *.fastq.gz
do
zcat $seq | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > ./$seq.txt
done












