#This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=4G -pe threads 16
# -l himem
#$-V
# -t 1-3


#Standard W22 reference
ref_dir=/grid/martienssen/data_norepl/bberube/maize/tpd/index/bowtie1_index/w22_bowtie1.fa

#Preliminary TPD contigs
#tpd_ref_dir=/grid/martienssen/data_norepl/bberube/maize/tpd/assembly_analysis/contigs-racon1.min50k.fasta

#B73 reference
#b73_ref_dir=/sonas-hs/martienssen/hpc_norepl/data/bberube/maize/tpd/srna_analysis/H5YCTBGXF/index/Zea_mays.AGPv4.dna.toplevel.fa

#### Alignment of 22nt filtered libs for 22nt-specific analysis ####

#Against W22 ref, standard parameters
#Done for leaf and pollen samples to compare 22nt sRNA accumulation in genic regions

#ShortStack --readfile wt.leaf.r$SGE_TASK_ID.22.fastq --genomefile $ref_dir \
# --bowtie_cores 16 --sort_mem 30G --mmap u --dicermin 20 --dicermax 24 \
# --bowtie_m all --mismatches 1 --pad 250 --outdir wt.leaf.r$SGE_TASK_ID.22.out

#ShortStack --readfile tpd.leaf.r$SGE_TASK_ID.22.fastq --genomefile $ref_dir \
# --bowtie_cores 16 --sort_mem 30G --mmap u --dicermin 20 --dicermax 24 \
# --bowtie_m all --mismatches 1 --pad 250 --outdir tpd.leaf.r$SGE_TASK_ID.22.out

#### Alignment of unmapped read fractions (from Drive samples) to TPD prelim assembly ####

#Against prelim TPD contigs
#Done to obtain unique/interesting sRNA loci that align to teosinte intervals

#ShortStack --readfile drive.unmapped.fastq.gz --genomefile $tpd_ref_dir \
# --bowtie_cores 16 --sort_mem 30G --mmap u --dicermin 20 --dicermax 24 \
# --bowtie_m all --mismatches 1 --foldsize 1000 --outdir tpd.unmapped.out

#### Alignment of leaf and pollen pools ####

#ShortStack --bamfile wt.merge.bam --genomefile $ref_dir \
# --bowtie_cores 16 --sort_mem 30G --mmap u --dicermin 20 --dicermax 24 \
# --bowtie_m all --mismatches 1 --foldsize 1000 --pad 250 --outdir wt.merge.out

#ShortStack --bamfile tpd.merge.bam --genomefile $ref_dir \
# --bowtie_cores 16 --sort_mem 30G --mmap u --dicermin 20 --dicermax 24 \
# --bowtie_m all --mismatches 1 --foldsize 1000 --pad 250 --outdir tpd.merge.out

#Pollen only pool
ShortStack --bamfile merge.bam --genomefile $ref_dir \
 --bowtie_cores 16 --sort_mem 30G --mmap u --dicermin 20 --dicermax 24 \
 --bowtie_m all --mismatches 1 --foldsize 1000 --pad 250 --outdir pollen.merge,out


#### Standard alignment of filtered reads to W22 reference ####
#ShortStack --readfile wt.leaf.r$SGE_TASK_ID.len.fastq.gz --genomefile $ref_dir \
# --bowtie_cores 16 --sort_mem 30G --mmap u --dicermin 20 --dicermax 24 \
# --bowtie_m all --mismatches 1 --pad 250 --outdir wt.leaf.r$SGE_TASK_ID.out

#ShortStack --readfile tpd.leaf.r$SGE_TASK_ID.len.fastq.gz --genomefile $ref_dir \
# --bowtie_cores 16 --sort_mem 30G --mmap u --dicermin 20 --dicermax 24 \
# --bowtie_m all --mismatches 1 --pad 250 --outdir tpd.leaf.r$SGE_TASK_ID.out






