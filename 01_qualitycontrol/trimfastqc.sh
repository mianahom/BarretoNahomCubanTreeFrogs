#!/bin/bash
#SBATCH --job-name=fastqc_oftrimmedreads
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 4
#SBATCH --mem=100G
#SBATCH --time 12:00:00
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mia.nahom@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err
echo hostname


## Changing directories to where the fastq files are located
cd ~/BarretoNahomFrogs/02_trimming/trimmomatic_outputs

## Loading modules required for script commands
module load fastqc

# output directory
OUTDIR=~/BarretoNahomFrogs/01_qualitycontrol/trim
mkdir -p $OUTDIR

## Running FASTQC
fastqc -t 6 -o $OUTDIR *.fastq.gz
