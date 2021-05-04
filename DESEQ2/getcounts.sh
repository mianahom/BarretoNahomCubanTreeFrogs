#!/bin/bash
#SBATCH --job-name=getcounts
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=20G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mia.nahom@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -o %x_%j.err


awk '{print $1 "\t" $4}' ../08_Counts/AD-2-108-3_S224.counts/abundance.tsv > AD-2-108-3.counts
awk '{print $1 "\t" $4}' ../08_Counts/AD-4-28-4_S233.counts/abundance.tsv > AD-4-28-4.counts
awk '{print $1 "\t" $4}' ../08_Counts/AD-5-152-2_S236.counts/abundance.tsv > AD-5-152-2.counts
awk '{print $1 "\t" $4}' ../08_Counts/AD-7-125-1_S246.counts/abundance.tsv > AD-7-125-1.counts
awk '{print $1 "\t" $4}' ../08_Counts/AD-7-149-2_S243.counts/abundance.tsv > AD-7-149-2.counts
awk '{print $1 "\t" $4}' ../08_Counts/AD-9-127-2_S251.counts/abundance.tsv > AD-9-127-2.counts
