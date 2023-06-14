#!/bin/bash
#$ -V
#$ -cwd
#$ -l m_mem_free=20G
#$ -j y
#$ -o uge.log
#$ -N bwa2.index


bwa-mem2 index GCA_001644905_W22.fna
