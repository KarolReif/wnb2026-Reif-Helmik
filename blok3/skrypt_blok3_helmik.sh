#!/bin/bash

mkdir -p data/ref db blok3

./blok3/get_genome.sh data/bio_ids.txt
gunzip -c GCA_*_genomic.fna.gz > data/ref/genome.fa

awk -F',' 'NR>=6 && (NR-6)%2==0 { print ">"$1"\n"$2 }' data/DArT_SNP.csv > data/probes.fa

makeblastdb -in data/ref/genome.fa -dbtype nucl -out db/genome

blastn \
  -task blastn \
  -db db/genome \
  -query data/probes.fa \
  -out data/blast_raw.tsv \
  -evalue 1e-10 \
  -max_target_seqs 1 \
  -num_threads 4 \
  -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore"

awk -F'\t' -v OFS='\t' '$3>=96 && $4>=68' data/blast_raw.tsv > data/blast_filtered.tsv

sort -k1,1 -k12,12gr data/blast_filtered.tsv \ |
	awk -F'\t' '!widziane[$1]++' > data/blast_best.tsv

awk -F'\t' -v OFS='\t' '{ print $0, ($9 < $10 ? "+" : "-") }' data/blast_best.tsv > blok3/dart_blast_filtered.tsv
