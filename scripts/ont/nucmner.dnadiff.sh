# This script is submitted to UGE using the qsub <your.script> command. 
#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l m_mem_free=4G -pe threads 32
#$ -V

nucmer -t 32 w22.fasta tpd1asm202009.fasta
