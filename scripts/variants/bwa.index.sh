#!/bin/bash
#$ -V
#$ -cwd
#$ -l m_mem_free=20G
#$ -j y
#$ -o uge.log
#$ -N bwa.index

bwa index Zea_mays.AGPv3.22.dna.toplevel.fa


