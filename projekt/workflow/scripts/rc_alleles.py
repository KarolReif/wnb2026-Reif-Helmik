import pandas as pd

input_tsv = snakemake.input[0]
output_tsv = snakemake.output[0]

df = pd.read_csv(input_tsv, sep="\t")

komplement = {"A": "T", "T": "A", "C": "G", "G": "C", "N": "N"}
maska = df["STRAND"] == "-"
df.loc[maska, "REF"] = df.loc[maska, "REF"].map(komplement)
df.loc[maska, "ALT"] = df.loc[maska, "ALT"].map(komplement)

df.to_csv(output_tsv, sep="\t", index=False)
