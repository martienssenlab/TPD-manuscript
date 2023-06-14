# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=15G
#$-V

for seq in *.fastq.gz
do
zcat $seq | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > ./$seq.txt
done

