# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=20G
#$-V


#Extract positional information
grep -w 'DP' single.pollen.filter.vcf | grep -w -E 'A|C|T|G' | awk -v OFS='\t' '{print $1,$2}' > coordinates.pos
#Extract allele information, generate matrix
grep -w 'DP' single.pollen.filter.vcf | grep -w -E 'A|C|T|G' | 
awk -v s=10 -v e=33 'BEGIN{FS=OFS="\t"}{for (i=s; i<=e; ++i) printf "%s%s", $i, (i<e?OFS:ORS)}' |
awk '{for(i=1;i<NF+1;i++) {$i=substr($i,1,1) } OFS=" "; print $0}' > single.pollen.matrix

#paste tusc_targets.pos tusc_targets.alleles | column -s '\t' -t > tusc_targets.tmp
#awk -v s=1 -v e=122 'BEGIN{FS=OFS="\t"}{for (i=s; i<=e; ++i) printf "%s%s", $i, (i<e?OFS:ORS)}' tusc_targets.tmp > tusc_targets.matrix

#rm -f tusc_targets.pos
#rm -f tusc_targets.alleles
#rm -f tusc_targets.tmp




