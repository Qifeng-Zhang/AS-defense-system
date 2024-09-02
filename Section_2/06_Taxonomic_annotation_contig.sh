#!/bin/bash

#########################################################################
# Description: Taxonomic annotation of contigs containing complete defense systems using kraken2 and krakentools.
# Requires: Kraken2 v2.1.3, krakentools, and defense system contig files (*.dfcontig.fasta).
#########################################################################

for file in `ls /PATH_TO_DS_CONTIG_FILES/*.dfcontig.fasta`
do
j=`basename $file .dfcontig.fasta`
kraken2 \
--db /PATH_TO_KRAKEN2_DATABASE/ \
--output /PATH_TO_OUTPUT_KRAKEN/$j.kraken \
--report /PATH_TO_OUTPUT_KREPORT/$j.kreport \
/PATH_TO_DS_CONTIG_FILES/$j.dfcontig.fasta
done

#########################################################################

for file in `ls /PATH_TO_OUTPUT_KREPORT/$j.kreport`
do
j=`basename $file .kreport`
echo "Processing $j..."
python3 /PATH_TO_KRAKENTOOLS/kraken2_translate.py \
--report /PATH_TO_OUTPUT_KREPORT/$j.kreport \
--classification /PATH_TO_OUTPUT_KRAKEN/$j.kraken \
--output /PATH_TO_OUTPUT_TAXONOMY/$j.csv \
--mpa-format
done

#########################################################################
