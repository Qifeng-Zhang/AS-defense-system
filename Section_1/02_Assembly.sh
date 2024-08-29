#!/bin/bash

#########################################################################
# Description: Metagenomic clean reads assembly using megahit.
# Requires: Megahit v1.2.9 and metagenomic clean reads (*.fastq files).
#########################################################################

for file in `ls /PATH_TO_CLEAN_READS/*.trimmed.1.fastq`
do
j=`basename $file .trimmed.1.fastq`
megahit  \
-1 /PATH_TO_CLEAN_READS/"$j".trimmed.1.fastq \
-2 /PATH_TO_CLEAN_READS/"$j".trimmed.2.fastq \
-o /PATH_TO_OUTPUT_CONTIG/$j \
--k-list 21,41,61,81,99 \
--min-contig-len 1000 \
--out-prefix $j \
done

#########################################################################
