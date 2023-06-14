# This script is submitted to UGE using the qsub <your.script> command. 
#!sh
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=20G
#$-V


plotPCA --corData wt.drive.compare --plotFile drive.srna.pdf





