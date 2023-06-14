#!/bin/bash
#$ -V
#$ -cwd
#$ -pe threads 16
#$ -l m_mem_free=5G


in=tpd1asm202009.fasta
out=tpd1asm202009.out

RepeatMasker -e rmblast -no_is -nolow -pa 4 -s -lib ZmHARB.fasta -dir $out $in




