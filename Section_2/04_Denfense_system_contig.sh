#!/bin/bash

#########################################################################
# Description: Identify complete defense systems in contigs using DefenseFinder.
# Requires: defensefinder v1.2.1 and contig protein files (*.protein.fa).
#########################################################################

for file in `ls /PATH_TO_CONTIG_PROTEIN_FILES/*.protein.fa`
do
j=`basename $file .protein.fa`
defense-finder run \
-o /PATH_TO_OUTPUT_DS/$j \
--db-type gembase \
/PATH_TO_CONTIG_PROTEIN_FILES/$j.protein.fa
done

#########################################################################
