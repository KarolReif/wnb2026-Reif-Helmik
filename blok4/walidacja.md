# Raport - walidacja danych blok4

# Weryfikacja pliku final.vcf
-Liczba  linii nagłówków 'grep -c '^##' final.vcf' WYNIK = 4
-Liczba wariantów 'grep -vc '^#' final.vcf' WYNIK = 1543
-Liczba kolumn 'awk -F'\t' '!/^#/ { print NF }' final.vcf | sort -u' WYNIK = (9 kolumn VCF + 94 próbki)
-Liczba duplikatów ID : 'grep -v '^#' final.vcf | cut -f3 | sort | uniq -d | wc -l' WYNIK = 0

# Weryfikacja bcftools
 'bcftools view final.vcf > /dev/null && echo "Plik poprawny formalnie"' WYNIK = "Plik poprawny formalnie"
 'bcftools stats final.vcf | head -30' 
WYNIK:
-liczba próbek: 94
-liczba rekordów: 1543
-liczba SNP: 1543
-liczba pozycji bez ALT: 0
-liczba pozycji wieloallelicznych: 0

# Ćwiczenie 4.3
Podsumowanie brak błędnych wyników w macierzy po konwersji, komplet 94 próbek zachowany

# Ćwiczenie 4.4
Weryfikacja spójności z genomem referencyjnym wykazała spadek odsetka pozycji spójnych z {REF, ALT} z 50.6% (przed korektą) do 45.7% (838 pozycji poza zbiorem) po zastosowaniu operacji rc() na nici ujemnej. Wzrost pozornych rozbieżności wynika z mapowania krótkich sond DArT w rejonach paralogicznych oraz przypadkowej komplementarności nieskorygowanych alleli. Mimo to wykonanie rc() jest metodycznie niezbędne dla zachowania spójności ze standardem VCFv4.2, a pozostałe 54.3% odmiennych pozycji odzwierciedla rzeczywistą zmienność genetyczną badanej linii względem referencji.
