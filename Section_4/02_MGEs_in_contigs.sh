#!/bin/bash

#########################################################################
# Description: Annotation of MGEs in contigs using mobileOG.
# Requires: mobileOG (beatrix-1.6) and contig files (*.contig.fasta).
#########################################################################

for file in `ls /PATH_TO_CONTIG/*.contig.fasta`
do
bash mobileOGs-pl-kyanite.sh \
-i $file \
-d /PATH_TO_MOBILEOG_DATABASE/mobileOG-db-beatrix-1.6.dmnd \
-m /PATH_TO_MOBILEOG_DATABASE/mobileOG-db-beatrix-1.6.All.csv \
-k 15 \
-e 1e-10 \
-p 75 \
-q 75
done

#########################################################################
