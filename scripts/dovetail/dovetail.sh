#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=3G -pe threads 48
#$-V

#Dovetail Omni-C data processing pipeline
ref=../index/bwa/GCA_001644905_W22.fna
genome=w22.genome
cores=48

#Alignment
bwa mem -5SP -t $cores $ref \
all.r1.trim.fastq.gz all.r2.trim.fastq.gz |

pairtools parse \
 --chroms-path $genome \
 --min-mapq 30 \
 --walks-policy 5unique \
 --max-inter-align-gap 30 \
 --nproc-in $cores --nproc-out $cores |

pairtools sort \
 --nproc $cores |

pairtools dedup \
 --nproc-in $cores --nproc-out $cores \
 --mark-dups  \
 --output-stats all.PT.stats.txt \
 --output-dups - |

pairtools split \
 --nproc-in $cores --nproc-out $cores \
 --output-pairs all.PT.pairs.gz  \
 --output-sam - |

samtools view -bS - |
samtools sort --threads $cores - -o all.pt.bam
samtools index all.pt.bam

preseq lc_extrap -B -P -e 2.1e9 -s 1e8 -seg_len 1000000000 -o all.preseq all.pt.bam
#./get_qc.py -p all.PT.stats.txt -d all.preseq





