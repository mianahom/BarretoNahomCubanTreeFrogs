#!/bin/bash
#SBATCH --job-name=vsearch
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=80G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mia.nahom@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

##################################################
##  	Clustering using vsearch		##
##################################################
module load vsearch/2.15.0

vsearch --threads 8 --log LOGFile \
	--cluster_fast ../../04_CodingRegions/trinity_combine.fasta.transdecoder.cds \
	--id 0.90 \
	--centroids centroids.fasta \
	--uc clusters.uc

date 
