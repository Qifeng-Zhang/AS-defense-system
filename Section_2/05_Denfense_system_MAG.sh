#!/bin/bash

#########################################################################
# Description: Identify complete defense systems in MAGs using DefenseFinder.
# Requires: defensefinder v1.2.1 and MAG protein files (*.protein.fa).
#########################################################################

for file in `ls /PATH_TO_MAG_PROTEIN_FILES/*.protein.fa`
do
j=`basename $file .protein.fa`
defense-finder run \
-o /PATH_TO_OUTPUT_DS/$j \
--db-type gembase \
/PATH_TO_MAG_PROTEIN_FILES/$j.protein.fa
done

#########################################################################
