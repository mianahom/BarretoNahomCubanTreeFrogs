#!/bin/bash
#SBATCH --job-name=counts
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=30G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --array=[0-7]
##SBATCH --mail-type=ALL
##SBATCH --mail-user=mia.nahom@uconn.edu
#SBATCH -o %x_%A_%a.out
#SBATCH -e %x_%A_%a.err

hostname
date

##########################################
## kallisto quantification algorithm    ##      
##########################################

module load kallisto/0.44.0


# get one sample ID using the slurm array task ID

#find our sample IDS
TRIM=($(find ../02_Trimming/ -name "*.fastq.gz"))
TRIM1=${TRIM[$SLURM_ARRAY_TASK_ID]}
echo $TRIM1


#get corresponding sample ID
#SAM=$(basename $TRIM1 | sed 's/_001.fastq.gz//' | cut -d 's/_L004_R*//')
SAM=$(basename $TRIM1 | cut -d '_' -f 2,3)
echo $SAM

kallisto quant \
        -i ../05_Clustering/clustertransdecoder/centroids.fasta.index \
        -o ${SAM}.counts \
        -t 8 \
        ../02_Trimming/trim_${SAM}_L004_R1_001.fastq.gz ../02_Trimming/trim_${SAM}_L004_R2_001.fastq.gz
