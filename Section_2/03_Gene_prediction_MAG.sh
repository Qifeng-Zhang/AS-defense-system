#!/bin/bash

#########################################################################
# Description: Use prodigal to predict orfs in MAGs.
# Requires: prodigal v2.6.3 and MAG files (*.MAG.fa).
#########################################################################

for file in `ls /PATH_TO_MAG_FILES/*.MAG.fa`
do
j=`basename $file .MAG.fa`
prodigal \
-i /PATH_TO_MAG_FILES/$j.MAG.fa \
-o /PATH_TO_OUTPUT_ORF_FILES/$j.gff \
-a /PATH_TO_OUTPUT_PROTEIN_FILES/$j.protein.fa \
-d /PATH_TO_OUTPUT_DNA_FILES/$j.DNA.fa \
-f gff -p meta
done

#########################################################################
