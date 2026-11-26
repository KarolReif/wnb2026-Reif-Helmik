BEGIN { FS = ","; OFS = "\t" }
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
}
