#!/bin/bash

#########################################################################
# Description: Quality control of metagenomic raw reads using kneaddata.
# Requires: Kneaddata v0.12.0 and metagenomic raw reads (*.fastq files).
#########################################################################

for file in `ls /PATH_TO_RAW_READS/*1.fastq`
do
j=`basename $file _1.fastq`
kneaddata \
-i1 /PATH_TO_RAW_READS/${j}_1.fastq \
-i2 /PATH_TO_RAW_READS/${j}_2.fastq \
-o /PATH_TO_OUTPUT_CLEAN_READS/ \
--bypass-trf \
--output-prefix $j \
--trimmomatic /PATH_TO_TRIMMOMATIC/ \
--remove-intermediate-output
done

#########################################################################
