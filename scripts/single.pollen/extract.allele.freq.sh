#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=10G
#$-V


grep -w 'AF' merge.chr5.vcf | awk '{print $8}' | sed -nr 's/\s*;\s*/\n/gp' | grep -w "AF" > merge.chr5.AF
sed -e 's!AF=!!' merge.chr5.AF > merge.chr5.AF1
sed 's/,.*//' merge.chr5.AF1 > merge.chr5.AF2
grep -w 'AF' merge.chr5.vcf | awk -F '\t' '{print $1" "$2}' > merge.chr5.pos
sed -i '1d' merge.chr5.pos

grep -w 'AF' merge.chr6.vcf | awk '{print $8}' | sed -nr 's/\s*;\s*/\n/gp' | grep -w "AF" > merge.chr6.AF
sed -e 's!AF=!!' merge.chr6.AF > merge.chr6.AF1
sed 's/,.*//' merge.chr6.AF1 > merge.chr6.AF2
grep -w 'AF' merge.chr6.vcf | awk -F '\t' '{print $1" "$2}' > merge.chr6.pos
sed -i '1d' merge.chr6.pos


