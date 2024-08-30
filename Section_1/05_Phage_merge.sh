#!/bin/bash

#########################################################################
# Description: Merge the output of virsorter2 (VS2) and virbrant (VB) and extract the phage sequence using shell and seqkit.
# Requires: seqkit v2.3.1, VS2 output files (final-viral-score.tsv), VB output files (*.contigs.phages_combined.txt), and contig files (*.fa files).
#########################################################################

mkdir /PATH_TO_OUTPUT_MERGE_FILES/
mkdir /PATH_TO_OUTPUT_PHAGE_SEQ_BEFORE_CV/

for i in /PATH_TO_VS2_FILES/*
do base=$(basename $i)

# Virsorter2 score>=0.9
cat /PATH_TO_VS2_FILES/${base}/final-viral-score.tsv | awk '{if ($4>=0.9) print $1}' > /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.9_name.txt

# Virsorter2 score>=0.7 along with hallmark>=1
cat /PATH_TO_VS2_FILES/${base}/final-viral-score.tsv | awk '{if ($4>=0.7 && $7>=1) print $1}' > /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.7_hm1_name.txt

# combined and remove duplication
cat /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.9_name.txt /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.7_hm1_name.txt > /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.9_0.7_hm1_name.txt
sort -n /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.9_0.7_hm1_name.txt | uniq > /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.9_0.7_hm1_name_uni.txt

# remove sequence ID suffix (VS2)
cut -f1 -d"|" /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.9_0.7_hm1_name_uni.txt > /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.9_0.7_hm1_id_uni.txt

# Virsorter2 score >=0.5
cat /PATH_TO_VS2_FILES/${base}/final-viral-score.tsv | awk '{if ($4>=0.5) print $1}' > /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.5_name.txt

# remove sequence ID suffix (VS2)
cut -f1 -d"|" /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.5_name.txt > /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.5_id.txt

# remove sequence ID suffix (VB)
cut -f1 -d" " /PATH_TO_VB_FILES/${base}/VIBRANT_${base}.contigs/VIBRANT_phages_${base}.contigs/${base}.contigs.phages_combined.txt > /PATH_TO_OUTPUT_MERGE_FILES/${base}_vb_id.txt

# Virsorter2 score >= 0.5 and VIBRANT validation
cat /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.5_id.txt /PATH_TO_OUTPUT_MERGE_FILES/${base}_vb_id.txt | sort | uniq -d > /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.5_vb_id_uni.txt

# final viral contigs name (union set)
cat /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.9_0.7_hm1_id_uni.txt /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs0.5_vb_id_uni.txt | sort | uniq > /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs_vb_merge_id_uni.txt

# add sample id
sed -i "s/^/${base}\_/" /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs_vb_merge_id_uni.txt

# extract viral contig sequences
seqkit grep -f /PATH_TO_OUTPUT_MERGE_FILES/${base}_vs_vb_merge_id_uni.txt /PATH_TO_CONTIG_FILES/${base}.contigs.fa -o /PATH_TO_OUTPUT_PHAGE_SEQ_BEFORE_CV/${base}_vs_vb_merge_uni.fa

done

#########################################################################

# merge viral contig sequences
cat /PATH_TO_OUTPUT_PHAGE_SEQ_BEFORE_CV/*_vs_vb_merge_uni.fa > /PATH_TO_OUTPUT_PHAGE_SEQ_BEFORE_CV/vseq_before_cv_merge.fa

#########################################################################

