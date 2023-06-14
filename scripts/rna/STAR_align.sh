# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=4G -pe threads 16
#$-V
#$ -t 1-10

#ref_dir=/sonas-hs/martienssen/hpc_norepl/data/bberube/maize/tpd/rna_analysis/TissueAtlas/index

#### Alignment of RNAseq data to Tpd genome via STAR

ref_dir=/grid/martienssen/data_norepl/bberube/maize/tpd/rna.analysis/HHJV7BGXF/Tpd_alignment

STAR --runThreadN 16 --genomeDir $ref_dir \
 --readFilesIn 304887.$SGE_TASK_ID.r1.fastq.gz 304887.$SGE_TASK_ID.r2.fastq.gz \
 --readFilesCommand zcat \
 --outFileNamePrefix 304887.$SGE_TASK_ID \
 --outSAMtype BAM SortedByCoordinate \
 --twopassMode Basic \







###
#STAR --runThreadN 16 --genomeDir $ref_dir \
# --readFilesIn embryo.r$SGE_TASK_ID.trim.fastq.gz \
# --readFilesCommand zcat \
# --outFileNamePrefix embryo.r$SGE_TASK_ID \
# --outFilterMultimapNmax 40 \
# --outSAMtype BAM SortedByCoordinate \
# --twopassMode Basic \

###
#STAR --runThreadN 16 --genomeDir $ref_dir \
# --readFilesIn endosperm.r$SGE_TASK_ID.trim.fastq.gz \
# --readFilesCommand zcat \
# --outFileNamePrefix endosperm.r$SGE_TASK_ID \
# --outFilterMultimapNmax 40 \
# --outSAMtype BAM SortedByCoordinate \
# --twopassMode Basic \

###
#STAR --runThreadN 16 --genomeDir $ref_dir \
# --readFilesIn leaf.r$SGE_TASK_ID.trim.fastq.gz \
# --readFilesCommand zcat \
# --outFileNamePrefix leaf.r$SGE_TASK_ID \
# --outFilterMultimapNmax 40 \
# --outSAMtype BAM SortedByCoordinate \
# --twopassMode Basic \

###
#STAR --runThreadN 16 --genomeDir $ref_dir \
# --readFilesIn pollen.r$SGE_TASK_ID.trim.fastq.gz \
# --readFilesCommand zcat \
# --outFileNamePrefix pollen.r$SGE_TASK_ID \
# --outFilterMultimapNmax 40 \
# --outSAMtype BAM SortedByCoordinate \
# --twopassMode Basic \

###
#STAR --runThreadN 16 --genomeDir $ref_dir \
# --readFilesIn root.r$SGE_TASK_ID.trim.fastq.gz \
# --readFilesCommand zcat \
# --outFileNamePrefix root.r$SGE_TASK_ID \
# --outFilterMultimapNmax 40 \
# --outSAMtype BAM SortedByCoordinate \
# --twopassMode Basic \

###
#STAR --runThreadN 16 --genomeDir $ref_dir \
# --readFilesIn silks.r$SGE_TASK_ID.trim.fastq.gz \
# --readFilesCommand zcat \
# --outFileNamePrefix silks.r$SGE_TASK_ID \
# --outFilterMultimapNmax 40 \
# --outSAMtype BAM SortedByCoordinate \
# --twopassMode Basic \





