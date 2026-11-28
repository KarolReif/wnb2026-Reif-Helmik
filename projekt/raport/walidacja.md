# Wyniki walidacji pliku VCF

## 1. Kontrole podstawowe
- Wiersze nagłówkowe (##): 4
- Liczba wariantów: 1543
- Liczba kolumn danych: 103
- Zduplikowane ID markerów: 0
- Formalna poprawność (bcftools view): OK

## 2. Statystyki bcftools stats
```
[W::vcf_parse] Contig 'CM007361.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007362.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007363.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007364.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007365.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007366.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007367.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007368.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007369.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007370.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007371.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007372.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007373.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007374.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
[W::vcf_parse] Contig 'CM007375.1' is not defined in the header. (Quick workaround: index the file with tabix.)
[W::vcf_parse] Missing headers may cause later processing to fail
```

## 3. Spójność z genomem referencyjnym
```
genom = DArT REF: 367
genom = DArT ALT: 338
poza {REF, ALT}: 838
spójnych (REF lub ALT): 45.7%
```
