# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=4.0G -pe threads 8
#$-V
# -t 1-15


#ref_dir=/sonas-hs/martienssen/hpc_norepl/data/bberube/maize/tpd/index/Zm00004b.gtf

#~/subread-2.0.0-Linux-x86_64/bin/./featureCounts \
# -a Zm00004b.gtf -o 304887.counts.final.nomm \
# 304887.1.bam 304887.2.bam 304887.3.bam 304887.4.bam 304887.5.bam \
# 304887.6.bam 304887.7.bam 304887.8.bam 304887.9.bam 304887.10.bam \
# 304887.11.bam 304887.12.bam 304887.13.bam 304887.14.bam 304887.15.bam \
# -T 8
 
#~/subread-2.0.0-Linux-x86_64/bin/./featureCounts \
# -a Zea_mays.AGPv4.36.chr.gtf -o tissues.counts \
# embryo.r1.bam embryo.r2.bam embryo.r3.bam \
# endosperm.r1.bam endosperm.r2.bam endosperm.r3.bam \
# leaf.r1.bam leaf.r2.bam leaf.r3.bam \
# pollen.r1.bam pollen.r2.bam pollen.r3.bam \
# root.r1.bam root.r2.bam root.r3.bam \
# silks.r1.bam silks.r2.bam silks.r3.bam \
# -T 8

#~/subread-2.0.0-Linux-x86_64/bin/./featureCounts \
# -F SAF -M -p -s 0 --primary -a srna.loci.saf -o srna.transcripts.mm.counts \
# 304887.1.filter.bam 304887.2.filter.bam 304887.3.filter.bam 304887.4.filter.bam 304887.5.filter.bam \
# 304887.6.filter.bam 304887.7.filter.bam 304887.8.filter.bam 304887.9.filter.bam 304887.10.filter.bam \
# 304887.11.filter.bam 304887.12.filter.bam 304887.13.filter.bam 304887.14.filter.bam 304887.15.filter.bam \
# -T 8

## Counting for TE Expression Analysis ##
featureCounts \
 -F GTF -p -s 0 -a liftover.new.gtf -o tpd.counts \
 wt.r1.bam wt.r2.bam wt.r3.bam wt.r4.bam wt.r5.bam \
 drive.r1.bam drive.r2.bam drive.r3.bam drive.r4.bam drive.r5.bam \
 -T 8











