#!/bin/bash

#########################################################################
# Description: Analysis of bacterial communities using kraken2 and bracken.
# Requires: Kraken2 v2.1.3, Bracken v2.8, and metagenomic clean reads (*.fastq files).
#########################################################################

for file in `ls /PATH_TO_CLEAN_READS/*.trimmed.1.fastq`
do
j=`basename $file .trimmed.1.fastq`
kraken2 \
--db /PATH_TO_KRAKEN2_DATABASE/ \
--output /PATH_TO_OUTPUT_KRAKEN_FILES/$j.kraken \
--report /PATH_TO_OUTPUT_KREPORT_FILES/$j.kreport \
--use-names \
--paired \
/PATH_TO_CLEAN_READS/$j.trimmed.1.fastq /PATH_TO_CLEAN_READS/$j.trimmed.2.fastq
done

#########################################################################

for file in `ls /PATH_TO_OUTPUT_KREPORT_FILES/$j.kreport`
do
echo "Processing $file..."
j=`basename $file .kreport`
bracken \
-d /PATH_TO_KRAKEN2_DATABASE/ \
-i /PATH_TO_KREPORT_FILES/$j.kreport \
-o /PATH_TO_OUTPUT_BRACKEN_FILES/$j.bracken \
-r 150
done

#########################################################################
