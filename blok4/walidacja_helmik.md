# Walidacja wyniku - Blok 4

## 15.1 Kontrole podstawowe
- Liczba wierszy nagłówkowych (grep -c '^##'): 4
- Liczba wariantów (grep -vc '^#'): 1543
- Unikalna liczba kolumn w wierszach danych (awk -F'\t' '!/^#/ { print NF }' | sort -u): 103
- Liczba powtórzonych markerów (grep -v '^#' | cut -f3 | sort | uniq -d | wc -l): 0

## 15.2 Kontrola narzędziem bcftools
- bcftools view final.vcf > /dev/null OK

## 15.3 Kontrola spójności z genomem
- genom = DArT REF: 367
- genom = DArT ALT: 338
- poza {REF,ALT}:  838
- spójnych (REF lub ALT): 45.7%

## Ćwiczenie 4.3
- W poprawnej wersji skryptu otrzymujemy właściwą liczbę braków danych (2462 `./.`). Przy ustawieniu `start = 26` liczba wzrasta do 22555 `./.`.
- Skrypt rozpoczynający pętlę od start = 26 odczytuje dodatkowe kolumny tekstu ze środka wiersza.
- Polecenie AWK każdą niepasującą wartość zamienia na brak danych `./.`, co skutkuje wzrostem ich liczby.

## Ćwiczenie 4.4
- Przed korektą spójność wynosi 50.6%, natomiast po korekcie spójność wynosi 45.7%
- Funkcja rc() użyta podczas korekcji nici zmienia pojedynczą zasadę na komplementarną
- Spadek procentu spójności wynika z tego, że przed korektą rc() w zestawie DArT znajdowały się nieprzekształcone litery, które przypadkowo mogły skutkować fałszywym dopasowaniem. Zamiana dostępnych alleli z {A, G} na {T, C} sprawiła, że dotychczasowe "przypadkowe trafy" przestały pasować.
