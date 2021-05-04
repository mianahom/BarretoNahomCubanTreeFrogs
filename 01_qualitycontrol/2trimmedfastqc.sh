#!/bin/bash
#SBATCH --job-name=2fastqc_oftrimmedreads
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 10
#SBATCH --mem=100G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mia.nahom@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err
echo hostname


## Changing directories to where the fastq files are located
cd /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads

## Loading modules required for script commands
module load fastqc

# output directory
OUTDIR=/labs/Knutie/BarretoNahomFrogs/01_qualitycontrol/2trim
mkdir -p $OUTDIR

## Running FASTQC
fastqc -t 10 -o $OUTDIR *.fastq.gz


