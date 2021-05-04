#!/bin/bash
#SBATCH --job-name=transdecoder
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 16
#SBATCH --mem=250G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mia.nahom@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err


module load hmmer
module load TransDecoder

TransDecoder.LongOrfs -t ../03_Assembly/trinity_combine.fasta

hmmscan --cpu 16 \
        --domtblout pfam.domtblout \
        /isg/shared/databases/Pfam/Pfam-A.hmm \
        trinity_combine.fasta.transdecoder_dir/longest_orfs.pep

TransDecoder.Predict -t ../03_Assembly/trinity_combine.fasta \
        --retain_pfam_hits pfam.domtblout \
        --cpu 16

