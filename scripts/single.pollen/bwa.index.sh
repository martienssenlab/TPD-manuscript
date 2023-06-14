#!/bin/bash
#$ -V
#$ -cwd
#$ -l m_mem_free=20G
#$ -j y
#$ -o uge.log
#$ -N bwa.index

bwa index w22.fa


