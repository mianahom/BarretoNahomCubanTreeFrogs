###our trinity assemblies were copied from another directory
###below is an example of the scripts we ran on our samples

#!/bin/bash
#SBATCH --job-name=1trinity
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 12
#SBATCH --mem=150G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mia.nahom@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

module load trinity/2.12.0

#SAM=AD-2-108-3_S224
Trinity --seqType fq \
  --left ../02_trimming/trimmed_reads/trim_AD-2-108-3_S224_L004_R1_001.fastq.gz \
  --right ../02_trimming/trimmed_reads/trim_AD-2-108-3_S224_L004_R2_001.fastq.gz \
  --min_contig_length 300 \
  --CPU 36 \
  --max_memory 150G \
  --output trinity_AD-2-108-3_S224 \
  --full_cleanup 

#SAM=
Trinity --seqType fq \
  --left ../02_trimming/trimmed_reads/trim_AD-2-125-2_S226_L004_R1_001.fastq.gz \
  --right ../02_trimming/trimmed_reads/trim_AD-2-125-2_S226_L004_R2_001.fastq.gz \
  --min_contig_length 300 \
  --CPU 36 \
  --max_memory 150G \
  --output trinity_AD-2-125-2_S226 \
  --full_cleanup 


