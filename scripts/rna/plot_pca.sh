# This script is submitted to UGE using the qsub <your.script> command. 
#!sh
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=20G
#$-V


#plotPCA --corData rna.compare \
# --plotFile rna.pca.pdf \
# --plotFileFormat pdf \
# --transpose \

plotCorrelation --corData rna.compare --corMethod pearson \
 --whatToPlot heatmap --colorMap Blues \
 --plotFile rna.pearson.pdf



