#!/bin/bash
#SBATCH --job-name=prefixcombine
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 16
#SBATCH --mem=100G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mia.nahom@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -o %x_%j.err

hostname
date

###adding sample name prefix to each sequence ID in each assembly
SAM=AD-2-108-3_S224
sed "s/>/>${SAM}_/g" ../03_Assembly/trinity_${SAM}.Trinity.fasta > ../03_Assembly/trinity_prefix_${SAM}.Trinity.fasta

SAM=AD-4-28-4_S233
sed "s/>/>${SAM}_/g" ../03_Assembly/trinity_${SAM}.Trinity.fasta > ../03_Assembly/trinity_prefix_${SAM}.Trinity.fasta

SAM=AD-5-152-2_S236
sed "s/>/>${SAM}_/g" ../03_Assembly/trinity_${SAM}.Trinity.fasta > ../03_Assembly/trinity_prefix_${SAM}.Trinity.fasta

SAM=AD-7-125-1_S246
sed "s/>/>${SAM}_/g" ../03_Assembly/trinity_${SAM}.Trinity.fasta > ../03_Assembly/trinity_prefix_${SAM}.Trinity.fasta

SAM=AD-7-149-2_S243
sed "s/>/>${SAM}_/g" ../03_Assembly/trinity_${SAM}.Trinity.fasta > ../03_Assembly/trinity_prefix_${SAM}.Trinity.fasta

SAM=AD-9-127-2_S251
sed "s/>/>${SAM}_/g" ../03_Assembly/trinity_${SAM}.Trinity.fasta > ../03_Assembly/trinity_prefix_${SAM}.Trinity.fasta

##concatenate the assemblies
cat ../03_Assembly/trinity_prefix_* > ../03_Assembly/trinity_combine.fasta
