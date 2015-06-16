#!/bin/bash
#$ -S /bin/bash
#$ -V
#$ -q all.q 
#$ -o ./out/
#$ -e ./err/
#$ -cwd
#$ -t 1-30
cancers=(ACC BLCA BRCA CESC CHOL COAD DLBC ESCA HNSC KICH KIRC KIRP LIHC LUAD LUSC MESO OV PAAD PCPG PRAD READ SARC SKCM STAD TCGT TGCA THYM UCEC UCS UVM)
RUN_ID=$((${SGE_TASK_ID}-1))
echo $RUN_ID
cancer=${cancers[$RUN_ID]}
echo $cancer
Rscript Stack.r $cancer 

