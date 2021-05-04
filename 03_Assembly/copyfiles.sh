#!/bin/bash
#SBATCH --job-name=copyselectfiles
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 14
#SBATCH --mem=60G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mia.nahom@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

cp /labs/Knutie/BarretoNahomFrogs/03_assembly/trinity_prefix_AD-2-108-3_S224.Trinity.fasta  .

cp /labs/Knutie/BarretoNahomFrogs/03_assembly/trinity_prefix_AD-5-152-2_S236.Trinity.fasta  .

cp /labs/Knutie/BarretoNahomFrogs/03_assembly/trinity_prefix_AD-4-28-4_S233..Trinity.fasta  .

cp /labs/Knutie/BarretoNahomFrogs/03_assembly/trinity_prefix_AD-7-149-2_S243.Trinity.fasta  .

cp /labs/Knutie/BarretoNahomFrogs/03_assembly/trinity_prefix_AD-7-125-1_S246.Trinity.fasta  .

cp /labs/Knutie/BarretoNahomFrogs/03_assembly/trinity_prefix_AD-9-127-2_S251.Trinity.fasta  .
