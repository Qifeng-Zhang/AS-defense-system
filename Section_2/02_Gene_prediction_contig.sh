#!/bin/bash

#########################################################################
# Description: Use prodigal to predict orfs in contigs.
# Requires: prodigal v2.6.3 and contig files (*.contigs.fa).
#########################################################################

for file in `ls /PATH_TO_CONTIG_FILES/*.contigs.fa`
do
j=`basename $file .contigs.fa`
prodigal \
-i /PATH_TO_CONTIG_FILES/$j.contigs.fa \
-o /PATH_TO_OUTPUT_ORF_FILES/$j.gff \
-a /PATH_TO_OUTPUT_PROTEIN_FILES/$j.protein.fa \
-d /PATH_TO_OUTPUT_DNA_FILES/$j.DNA.fa \
-f gff -p meta
done

#########################################################################
