#!/bin/bash

#########################################################################
# Description: De-redundancy of CRISPR spacers using CD-HIT.
# Requires: cd-hit v2.3.1 and CRISPR spacer files (*.Spacers.fasta).
#########################################################################

for file in `ls /PATH_TO_CRASS_FILES/Spacers/*.Spacers.fasta`
do
j=`basename $file .Spacers.fasta`
cd-hit-est \
-i /PATH_TO_CRASS_FILES/Spacers/$j.Spacers.fasta \
-o /PATH_TO_CRASS_FILES/Spacers_dr/$j.Spacers_dr.fasta \
-c 1.0 -G 0 -aS 1.0 -d 0 -g 1 -M 0
done

#########################################################################
