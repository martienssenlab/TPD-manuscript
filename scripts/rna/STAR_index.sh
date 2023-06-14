#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=2G -pe threads 16
#$-V

STAR --runMode genomeGenerate \
 --runThreadN 16 \
 --genomeDir /grid/martienssen/data_norepl/bberube/maize/tpd/rna.analysis/HHJV7BGXF/Tpd_alignment \
 --genomeFastaFiles tpd1asm202009.fasta \
 --sjdbGTFfile liftover.new.gff \
 --sjdbGTFtagExonParentTranscript Parent \
 --sjdbOverhang 75 




