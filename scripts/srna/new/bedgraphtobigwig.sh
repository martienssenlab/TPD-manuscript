#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=15G
#$-V

bedGraphToBigWig w22.sort.bdg w22.chrom.sizes.txt w22.bw
bedGraphToBigWig dcl2.sort.bdg w22.chrom.sizes.txt dcl2.bw
bedGraphToBigWig dcl2t.sort.bdg w22.chrom.sizes.txt dcl2t.bw


