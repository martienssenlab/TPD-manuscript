#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=20G
#$-V

#---------------------------------------------------------
# Bedgraph
#---------------------------------------------------------

sample=drive.r1.bam
out=drive.r1.bdg

READS=$(samtools view -c $sample)
NORM=$(echo 'scale=9;'1000000/$READS | bc)

#genomeCoverageBed -ibam $sample -bga -scale $NORM -strand + |
#    sortBed -i - > $out.p.bdg
#genomeCoverageBed -ibam $sample -bga -scale $NORM -strand - |
#    sortBed -i - > $out.m.bdg

#awk '{print $1" "$2" "$3" "$4*(-1)}' $out.m.bdg | awk 'BEGIN {OFS="\t"} {print $1,$2,$3,$4}' > $out.m.final.bdg

#cat $out.p.bdg $out.m.final.bdg | sort -k1,1 -k2,2n > $out.bdg

genomeCoverageBed -ibam $sample -bga -scale $NORM | sortBed -i - > $out


