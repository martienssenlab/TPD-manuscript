#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=3G -pe threads 16
#$-V

cores=16
chrlength=w22.genome

#Convert pairs files to juicer-compatible text file
#pairtools select '(pair_type=="UU") or (pair_type=="UR") or (pair_type=="RU") or (pair_type=="uu") or (pair_type=="Uu")  or (pair_type=="uU")' \
# all.PT.pairs.gz -o all.filtered.pairs.gz

#zcat all.filtered.pairs.gz |
# grep -v "#" |
# awk '{print "1\t"$2"\t"$3"\t1\t0\t"$4"\t"$5"\t0"}' |
# awk '{if ($2 > $6) {print $1"\t"$6"\t"$7"\t"$8"\t"$5"\t"$2"\t"$3"\t"$4} else {print}}' |
# sort -k2,2d -k6,6d  --parallel=$cores > all.juicer.alignments.txt

#Convert sorted text file to .hic
#java -jar -Xmx30g \
# juicertools.jar pre \
# all.juicer.alignments.txt all.hic $chrlength

#Convert pairs to .hic
pairix all.filtered.pairs.gz

cooler cload pairix \
 -p $cores \
 w22.genome:1000 \
 all.filtered.pairs.gz \
 all.cool

#generate multi-resolution cooler file from 1kb resolution cooler file
cooler zoomify --balance -p $cores all.cool







