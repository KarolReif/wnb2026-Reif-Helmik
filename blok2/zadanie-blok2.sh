#Polecenie tworzy plik probes.fa z pliku DArT_SNP.csv
awk -F ',' 'NR>=6 && (NR-6)%2==0 { print ">"$1; print $2 }' DArT_SNP.csv > ~/probes.fa

#Sprawdzenie liczby sekwencji
grep -c '>' ~/probes.fa
#Wynik: 2008

#Sprawdzenie długości sekwencji
awk 'NR%2==0 { print length($0) }' ~/probes.fa | sort -u
#Wynik: 69
