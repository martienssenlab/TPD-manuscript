# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=10G -pe threads 8
#$ -V
# -l himem

#~/minimap2/./minimap2 -t 16 -ax map-ont ../index/GCA_001644905_W22.fna.gz merge_trim.fastq.gz > tpd3a_ont.sam

#tag='.guppy-2.3.5ff.all.clip.hq.fastq.gz'

#minimap2 -t 16 -ax map-ont ./index/GCA_001644905_W22.fna tpd1a$tag > tpd1a.sam
#minimap2 -t 16 -ax map-ont ./index/GCA_001644905_W22.fna tpd1b$tag > tpd1b.sam
#minimap2 -t 16 -ax map-ont ./index/GCA_001644905_W22.fna tpd1c$tag > tpd1c.sam
#minimap2 -t 16 -ax map-ont ./index/GCA_001644905_W22.fna tpd1d$tag > tpd1d.sam
#minimap2 -t 16 -ax map-ont ./index/GCA_001644905_W22.fna tpd3a.guppy-2.3.7ff.all.clip.hq.fastq.gz > tpd3a.sam

#minimap2 -t 32 Zm-W22-REFERENCE-NRGENE-2.0.fasta contigs-racon1.fasta > w22-contigs-racon1.paf
#minimap2 -t 16 Zm-W22-chr5-6.fasta.gz contigs-racon1.fasta > w22_chr5-6-recon1.paf

#minimap2 -t 32 GCA_001644905_W22.fna contigs-racon1.min50k.fasta > w22-racon1.paf
#minimap2 -t 32 Tpd2_interval.fna contigs-racon1.min50k.fasta > Tpd2_interval-racon.paf

minimap2 -t 8 w22.chr5.fasta tpd1asm202009.chr5.fasta > w22-tpd1asm202009.chr5.paf


