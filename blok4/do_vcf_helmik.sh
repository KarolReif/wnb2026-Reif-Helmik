#!/bin/bash

awk -F'\t' -v OFS='\t' '
{
  split($2, a, "[:>]")
  print $1, a[1], a[2], a[3]
}' results/dart_info_oneline.tsv > dart_info_split.tsv

awk -F'\t' -v OFS='\t' '
NR == FNR {
  info[$1] = $2 OFS $3 OFS $4
  next
}
{
  print $0, ($1 in info ? info[$1] : OFS OFS)
}' dart_info_split.tsv results/dart_blast_filtered.tsv > dart_blast_with_snp.tsv

awk -F'\t' -v OFS='\t' '
{
  sstart = $9
  strand = $13
  snp = $14
  if (strand == "+") gpos = sstart + snp - 1
  else if (strand == "-") gpos = sstart - snp + 1
  else gpos = "NA"
  print $0, gpos
}' dart_blast_with_snp.tsv > dart_blast_with_genomic_snp.tsv

awk -F'\t' -v OFS='\t' '
BEGIN {
  print "CHROM", "POS", "ID", "REF", "ALT", "STRAND"
}
{
  print $2, $NF, $1, $15, $16, $13
}' dart_blast_with_genomic_snp.tsv > step1_core.tsv

awk -F'\t' -v OFS='\t' '
function rc(b) {
  if (b=="A") return "T"
  if (b=="T") return "A"
  if (b=="C") return "G"
  if (b=="G") return "C"
  return b
}
NR == 1 { print; next }
{
  if ($6 == "-") {
    $4 = rc($4)
    $5 = rc($5)
  }
  print
}' step1_core.tsv > step2_core_rc.tsv

awk -F',' -v OFS='\t' '
NR == 5 {
  nsamp = NF - 25
  printf "ID"
  for (i = 26; i <= NF; i++) printf OFS $i
  printf "\n"
  next
}
NR < 6 { next }
{
  start = NF - nsamp + 1
  if (prev == "") {
    prev = $1
    for (i = start; i <= NF; i++) ref[i - start] = $i
    next
  }
  printf "%s", $1
  for (i = start; i <= NF; i++) {
    r = ref[i - start]
    a = $i
    if (r == "-" || a == "-") gt = "./."
    else if (r == 1 && a == 0) gt = "0/0"
    else if (r == 0 && a == 1) gt = "1/1"
    else if (r == 1 && a == 1) gt = "0/1"
    else gt = "./."
    printf OFS gt
  }
  printf "\n"
  prev = ""
}' data/dart/DArT_SNP.csv > dart_genotypes.tsv

awk -F'\t' -v OFS='\t' '
NR == FNR {
  if (FNR == 1) { h = $0; next }
  id = $1
  $1 = ""
  sub(/^\t/, "", $0)
  g[id] = $0
  next
}
FNR == 1 {
  tmp = h
  sub(/^ID\t?/, "", tmp)
  print $0, tmp
  next
}
{
  print $0, ($3 in g ? g[$3] : "")
}' dart_genotypes.tsv step2_core_rc.tsv > step3_with_genotypes.tsv

{
  head -n 1 step3_with_genotypes.tsv
  tail -n +2 step3_with_genotypes.tsv | LC_ALL=C sort -t$'\t' -k1,1 -k2,2n
} > step3_sorted.tsv

awk -F'\t' -v OFS='\t' '
NR == 1 {
  print "##fileformat=VCFv4.2"
  print "##source=DArT-BLAST-pipeline"
  print "##INFO=<ID=STRAND,Number=1,Type=String,Description=\"Orientacja dopasowania BLAST\">"
  print "##FORMAT=<ID=GT,Number=1,Type=String,Description=\"Genotype\">"
  printf "#CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO\tFORMAT"
  for (i = 7; i <= NF; i++) printf "\t%s", $i
  printf "\n"
  next
}
{
  printf "%s\t%s\t%s\t%s\t%s\t.\tPASS\tSTRAND=%s\tGT", $1, $2, $3, $4, $5, $6
  for (i = 7; i <= NF; i++) printf "\t%s", $i
  printf "\n"
}' step3_sorted.tsv > final.vcf
