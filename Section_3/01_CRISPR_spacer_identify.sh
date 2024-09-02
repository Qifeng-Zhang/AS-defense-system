#!/bin/bash

#########################################################################
# Description: Identify and extract CRISPR spacers in clean reads using CRASS.
# Requires: CRASS v1.0.1 and clean reads (*.fq.gz).
#########################################################################

for file in `ls /PATH_TO_CLEAN_READS/*_1.fq.gz`
do
j=`basename $file _1.fq.gz`
crass \
-o /PATH_TO_OUTPUT_CRASS/$j \
/PATH_TO_CLEAN_READS/${j}_1.fq.gz \
/PATH_TO_CLEAN_READS/${j}_2.fq.gz
done

for file in `ls /PATH_TO_OUTPUT_CRASS/*/crass.crispr`
do
dn=`dirname $file`
bn=`basename $dn`
crisprtools stat -H \
$file > /PATH_TO_OUTPUT_CRASS/stat/$bn.stats.txt
done

for file in `ls /PATH_TO_OUTPUT_CRASS/*/crass.crispr`
do
dn=`dirname $file`
bn=`basename $dn`
crisprtools extract -d \
$file > /PATH_TO_OUTPUT_CRASS/DR/$bn.DR.fasta
done

for file in `ls /PATH_TO_OUTPUT_CRASS/*/crass.crispr`
do
dn=`dirname $file`
bn=`basename $dn`
crisprtools extract -s \
$file > /PATH_TO_OUTPUT_CRASS/Spacers/$bn.Spacers.fasta
done

for file in `ls /PATH_TO_OUTPUT_CRASS/*/crass.crispr`
do
dn=`dirname $file`
bn=`basename $dn`
crisprtools extract -f \
$file > /PATH_TO_OUTPUT_CRASS/Flanker/$bn.Flanker.fasta
done

#########################################################################
