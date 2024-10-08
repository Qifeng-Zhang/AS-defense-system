#!/bin/bash

#########################################################################
# Description: Calculate the abundance of defense systems using coverm.
# Requires: coverm v0.6.1, seqkit v2.3.1, and defense system contig files (*.dfcontig.fasta).
#########################################################################

for file in `ls /PATH_TO_CLEAN_READS/*_1.fq.gz`
do
j=`basename $file _1.fq.gz`
coverm contig \
-1 /PATH_TO_CLEAN_READS/"$j"_1.fq.gz \
-2 /PATH_TO_CLEAN_READS/"$j"_2.fq.gz \
-r /PATH_TO_DS_CONTIG/*.dfcontig.fasta \
-o /PATH_TO_OUTPUT_COVERM/$j.rpb.tsv \
-m reads_per_base -p bwa-mem --min-read-percent-identity 95 --min-read-aligned-percent 75
done

#########################################################################

seqkit stats /PATH_TO_CLEAN_READS/*_1.fq.gz > /PATH_TO_OUTPUT_SEQKIT/stats_clean_reads.txt

#########################################################################

for file in `ls /PATH_TO_COVERM_OUTPUT/*.rpb.tsv`
do
j=`basename $file .rpb.tsv`
awk -v j="$j" 'BEGIN {FS="\t";OFS="\t"} NR==FNR{if($1==j){a=$2}; next} {if (a!=0) {$2=$2/a*10^9}} 1' /PATH_TO_SEQKIT/stats_clean_reads.txt \
/PATH_TO_COVERM/$j.rpb.tsv > /PATH_TO_OUTPUT_RPKM/$j.RPKM.tsv
done

#########################################################################
