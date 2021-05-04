#!/bin/bash
#SBATCH --job-name=rnaQuast_NoTransdecoder
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

##################################################
## 		rnaQUAST			##
##################################################

module load rnaQUAST/1.5.2
module load GeneMarkS-T/5.1
module load python

rnaQUAST.py --transcripts ../05_Clustering/centroids.fasta \
	--gene_mark \
	--threads 8 \
	--output_dir results

date 
