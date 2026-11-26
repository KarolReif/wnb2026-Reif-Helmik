#Dziennik prac projektowych

## Blok 1
- Skończyliśmy konfigurację środowiska, kluczy SSH, repozytorium, utworzyliśmy pliki .gitignore i README.md.
- Dodaliśmy dwa skrypty "start_reif.sh" i "start_helmik.sh" poprzez oddzielne gałęzie, otworzyliśmy Pull request, wzajemnie oceniliśmy swój kod dzięki Code review i połączyliśmy gałęzie do main

#Blok 2
- Prawidłowo skonfigurowaliśmy logowanie za pomocą ssh bem2
- Utworzyliśmy środowisko środowisko bioinfo_base oraz eksportowaliśmy je  w blok2/ w repozytorium
- Wykonaliśmy zadanie 2.3
- Rozwiązaliśmy zadanie podsumowujące i zatwierdziliśmy je za pomocą Pull Requesta

#Blok 3
- Pobraliśmy genom referencyjny, utworzyliśmy bazę BLAST oraz przeprowadziliśmy mapowanie sond
- Przefiltrowaliśmy wyniki BLAST, wyznaczyliśmy orientację nici i wygenerowaliśmy plik dart_blast_filtered.tsv
- Utworzyliśmy skrypt odtwarzający cały blok 3 od genomu do pliku dart_blast_filtered.tsv oraz tabelę statystyk.
- Przesłaliśmy skrypt, plik dart_blast_filtered.tsv i tabelę statystyk na github i zatwierdziliśmy za pomocą Pull Requesta.

#Blok 4
- Utworzyliśmy środowisko vcf-env oraz katalog blok/4 z odniesieniami do wyników z bloku 3. 
- Skrypt do_vcf.sh umożliwia nam zamianę danych do VCF: rozbicie opisu SNP, złączenie z trafieniami BLAST, wyliczenie pozycji genomowej wraz z poprawą alleli komplementarnych na nici minus.
- Macierz DArT przekształciliśmy na genotypy. Wynik skompresowaliśmy i zapisaliśmy jako final.vcf.gz. 
- Przeprowadziliśmy walidację narzędziem bcftools i kontrolę spójności, zapisaliśmy wyniki i wnioski w pliku walidacja.md.
