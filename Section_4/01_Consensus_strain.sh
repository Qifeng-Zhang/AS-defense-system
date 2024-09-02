#!/bin/bash

#########################################################################
# Description: Reconstruction of consensus strain sequences using metaphlan and strainphlan.
# Requires: metaphlan v4.1.1, strainphlan v4.1.1 and clean reads (*.fq.gz).
#########################################################################

for file in `ls /PATH_TO_CLEAN_READS/*_1.fq.gz`
do
j=`basename $file _1.fq.gz`
metaphlan \
/PATH_TO_CLEAN_READS/"$j"_1.fq.gz,\
/PATH_TO_CLEAN_READS/"$j"_2.fq.gz \
--bowtie2out /PATH_TO_OUTPUT_MPA4/$j.bowtie2.bz2 \
-s /PATH_TO_OUTPUT_MPA4/sams/$j.sam.bz2 \
-o /PATH_TO_OUTPUT_MPA4/$j.mpa4.txt \
--input_type fastq \
--unclassified_estimation \
done

sample2markers.py \
-i /PATH_TO_OUTPUT_MPA4/sams/*.sam.bz2 \
-o /PATH_TO_OUTPUT_SPA4/consensus_markers

extract_markers.py \
-c t__SGB12599 \
-o /PATH_TO_MARKER/

strainphlan \
-s /PATH_TO_OUTPUT_SPA4/consensus_markers/*.json \
-m /PATH_TO_MARKER/t__SGB12599.fna \
-o /PATH_TO_OUTPUT_SPA4/ \
-c t__SGB12599 \
--mutation_rates

#########################################################################
