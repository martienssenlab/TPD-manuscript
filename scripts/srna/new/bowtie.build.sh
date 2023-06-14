#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=2G -pe threads 16
#$-V

#Build indices for Zea mays rRNA, rDNA, tRNA sequences for small RNA filtering
#bowtie2-build --threads 16 zm.rrna.fa zm.rrna.bowtie2
#bowtie2-build --threads 16 zm.rdna.fa zm.rdna.bowtie2
#bowtie2-build --threads 16 zm.trna.fa zm.trna.bowtie2

#Build index for file containing all structural RNA sequences to be filtered
bowtie2-build --threads 16 zm.struct.rna.fa zm.struct.rna.bowtie2

#Build index for w22 genome assembly
#bowtie2-build --threads 16 w22.fna w22.bowtie2


