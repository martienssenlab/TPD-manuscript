#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=20G
#$-V

#java -jar snpEff.jar build \
#	-gtf22 -v GCA_001644905_W22


#java -Xmx8g -jar snpEff.jar -v GCA_001644905_W22 301056.tpd1.filter.vcf > 301056.tpd1.ann.vcf

cat 301056.tpd1.ann.vcf |
	./vcfEffOnePerLine.pl |
	java -Xmx8g -jar SnpSift.jar extractFields - CHROM POS REF ALT "ANN[*].EFFECT" "ANN[*].IMPACT:" > Tpd.txt



