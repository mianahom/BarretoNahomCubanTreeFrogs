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

cp /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads/trim_AD-2-108-3_S224_L004_R1_001.fastq.gz  .

cp /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads/trim_AD-2-108-3_S224_L004_R2_001.fastq.gz  .


cp /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads/trim_AD-5-152-2_S236_L004_R1_001.fastq.gz  .

cp /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads/trim_AD-5-152-2_S236_L004_R2_001.fastq.gz  .


cp /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads/trim_AD-4-28-4_S233_L004_R1_001.fastq.gz  .

cp /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads/trim_AD-4-28-4_S233_L004_R2_001.fastq.gz  .


cp /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads/trim_AD-7-149-2_S243_L004_R1_001.fastq.gz  .

cp /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads/trim_AD-7-149-2_S243_L004_R2_001.fastq.gz  .


cp /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads/trim_AD-7-125-1_S246_L004_R1_001.fastq.gz  .

cp /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads/trim_AD-7-125-1_S246_L004_R2_001.fastq.gz  .

cp /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads/trim_AD-9-127-2_S251_L004_R1_001.fastq.gz  .

cp /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads/trim_AD-9-127-2_S251_L004_R2_001.fastq.gz  .

