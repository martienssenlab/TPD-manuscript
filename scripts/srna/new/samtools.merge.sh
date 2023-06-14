#!/bin/bash
#$ -V
#$ -cwd
#$ -pe threads 4
#$ -l m_mem_free=5G


#samtools merge -@ 4 merge.bam \
#	wt.r1.bam wt.r2.bam wt.r2.bam \
#	drive.r1.bam drive.r2.bam drive.r3.bam

#in1=wt.r1.leaf.bam
#in2=wt.r2.leaf.bam
#in3=wt.r3.leaf.bam
#in4=wt.r1.pollen.bam
#in5=wt.r2.pollen.bam
#in6=wt.r3.pollen.bam

#out=wt.leaf.pollen.bam

#samtools merge -@ 4 $out \
#	$in1 $in2 $in3 \
#	$in4 $in5 $in6

#samtools merge -@ 4 merge.bam \
#	wt.r1.bam wt.r2.bam \
#	dcl2T.r1.bam dcl2T.r2.bam \
#	dcl2.r1.bam dcl2.r2.bam

#samtools merge -@ 4 w22.bam wt.r1.bam wt.r2.bam
#samtools merge -@ 4 dcl2.bam dcl2.r1.bam dcl2.r2.bam
#samtools merge -@ 4 dcl2T.bam dcl2T.r1.bam dcl2T.r2.bam


samtools merge -@ 4 merge.22.out \
	wt.leaf.22.bam w22.22.bam dcl2T.22.bam dcl2.22.bam



#samtools merge -@ 4 w22.bam \
#	w22.r1.bam w22.r2.bam

#samtools merge -@ 4 dcl2t.bam \
#        dcl2t.r1.bam dcl2t.r2.bam

#samtools merge -@ 4 drive.bam \
#        drive.r1.bam drive.r2.bam
