#!/bin/bash

#########################################################################
# Description: Quality control of metagenomic raw reads.
# Requires: Kneaddata v0.12.0 and metagenomic raw reads (*.fastq files).
#########################################################################

for file in `ls /PATH_TO_CLEAN_READS/*.trimmed.1.fastq`
do
j=`basename $file .trimmed.1.fastq`
megahit  \
-1 /PATH_TO_CLEAN_READS/"$j".trimmed.1.fastq \
-2 /PATH_TO_CLEAN_READS/"$j".trimmed.2.fastq \
-o /PATH_TO_OUTPUT/$j \
--k-list 21,41,61,81,99 \
--min-contig-len 1000 \
--out-prefix $j \
done

#########################################################################
