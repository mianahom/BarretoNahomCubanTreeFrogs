### our files were copied over from another directory where they were trimmed
### below is our trimming scripts
#!/bin/bash
#SBATCH --job-name=2trim_rawreads
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 14
#SBATCH --mem=120G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mia.nahom@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err
echo hostname
######################################################################
# Trimming of Reads using Trimmomatic
#################################################################

mkdir singles2
mkdir trimmed_reads

#cd to directory with raw reads
cd ../SKnutie_reprocessedS4Lane4_15March2021

module load Trimmomatic/0.39

for infile in *_R1_001.fastq.gz
do
base=$(basename ${infile} _R1_001.fastq.gz)
java -jar $Trimmomatic PE -threads 14 -phred33 ${infile} ${base}_R2_001.fastq.gz \
trim_${base}_R1_001.fastq.gz trim_singles_${base}_R1_001.fastq.gz \
trim_${base}_R2_001.fastq.gz trim_singles_${base}_R2_001.fastq.gz \
ILLUMINACLIP:/labs/Knutie/BarretoNahomFrogs/02_trimming/TruSeq3-PE.fa:2:30:10 LEADING:20 TRAILING:20 SLIDINGWINDOW:4:20 MINLEN:45
done

# output directory
OUTDIR=/labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads
mkdir -p $OUTDIR
#mv outputs to new directory

mv trim_* $OUTDIR

cd /labs/Knutie/BarretoNahomFrogs/02_trimming/trimmed_reads
mv trim_singles_* ../singles2
