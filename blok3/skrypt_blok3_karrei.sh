#!/bin/bash

mkdir -p data/ref
cp /lustre/pd03/hpc-bkozak-1727983696/GCA_001865875.1_LupAngTanjil_v1.0_genomic.fna.gz data/ref/
gunzip -c data/ref/GCA_001865875.1_LupAngTanjil_v1.0_genomic.fna.gz > data/ref/genome.fa

awk -F',' 'NR>=6 && (NR-6)%2==0 { print ">"$1"\n"$2 }' DArT_SNP.csv > probes.fa
awk -F',' -v OFS='\t' 'NR>=7 && (NR-7)%2==0 { print $1, $11 }' DArT_SNP.csv > dart_info_oneline.tsv

mkdir -p db
makeblastdb -in data/ref/genome.fa -dbtype nucl -out db/genome

blastn \
-task blastn \
-db db/genome \
-query probes.fa \
-out blast_raw.tsv \
-evalue 1e-10 \
-max_target_seqs 1 \
-num_threads 4 \
-outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore"

awk -F'\t' -v OFS='\t' '$3 >= 96 && $4 >= 68' blast_raw.tsv > blast_96.tsv

sort -k1,1 -k12,12gr blast_96.tsv | awk -F'\t' '!widziane[$1]++' > blast_best.tsv

awk -F'\t' -v OFS='\t' '{ print $0, ($9 < $10 ? "+" : "-") }' blast_best.tsv > blok3/dart_blast_filtered_karrei.tsv

echo "Blok 3 zakończony pomyślnie"

