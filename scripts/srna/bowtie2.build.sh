#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=2G -pe threads 16
#$-V

#bowtie2-build --threads 16 zm_rrna.fa zm_rrna.bowtie2
bowtie2-build --threads 16 zm_rdna.fa zm_rdna.bowtie2


