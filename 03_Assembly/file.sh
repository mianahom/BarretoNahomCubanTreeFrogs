#!/bin/bash
#SBATCH --job-name=filemessup
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=50G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mia.nahom@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

cp /labs/Knutie/BarretoNahomFrogs/03_assembly/trinity_AD-4-28-4_S233.Trinity.fasta .

SAM=AD-4-28-4_S233
sed "s/>/>${SAM}_/g" trinity_${SAM}.Trinity.fasta > trinity_prefix_${SAM}.Trinity.fasta

cat trinity_prefix_* > trinity_combine.fasta

rm trinity_AD-4-28-4_S233.Trinity.fasta
