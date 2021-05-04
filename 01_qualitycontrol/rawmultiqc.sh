#!/bin/bash
#SBATCH --job-name=multiqc_ofrawreads
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=10G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mia.nahom@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

echo `hostname`

#################################################################
# MULTIQC of trimmed reads
#################################################################

module load MultiQC/1.9

# output directory
OUTDIR=./rawmultiqc
mkdir -p $OUTDIR

multiqc --outdir $OUTDIR ./raw/
