#!/bin/bash
#SBATCH --job-name=entap
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

##########################################
## Extract Sequences			## 
##########################################

# this part of the script extracts the peptide sequences identified by transdecoder (trinity_combine.fasta.transdecoder.pep)
# for only the sequences in our final clustered reference transcriptome (centroids.fasta)

module load seqtk/1.2


CENTROIDS=../05_Clustering/clustertransdecoder/centroids.fasta
PEPTIDES=../04_CodingRegions/trinity_combine.fasta.transdecoder.pep

grep -oP "(?<=>).*" $CENTROIDS >names.txt

seqtk subseq $PEPTIDES names.txt | sed 's/ .*//' >centroids.pep
 

##########################################
## EnTap				## 
##########################################
module load EnTAP/0.9.0-beta
module load diamond/2.0.6

# run EnTAP, flagging bacterial and fungal hits as possible contaminants and favoring hits to cuban tree frog genus (the Osteopilus genus)
EnTAP --runP \
-i centroids.pep \
-d /isg/shared/databases/Diamond/RefSeq/complete.protein.faa.202.dmnd \
-d /isg/shared/databases/Diamond/Uniprot/uniprot_sprot.dmnd \
-d /isg/shared/databases/Diamond/ntnr/nr_protein.202.dmnd \
--ontology 0  \
--threads 8 \
-c bacteria \
-c fungi \
--taxon Osteopilus

date 

