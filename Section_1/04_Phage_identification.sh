#!/bin/bash

#########################################################################
# Description: Identification of phage using virsorter2 and virbrant.
# Requires: virsorter v2.2.4, virbrant v1.2.1, and contig files (*.fa files).
#########################################################################

for file in `ls /PATH_TO_CONTIG_FILES/*.contigs.fa`
do
j=`basename $file .contigs.fa`
virsorter run \
-w /PATH_TO_OUTPUT_VS2/$j \
-i /PATH_TO_CONTIG_FILES/$j.contigs.fa \
--min-length 1500 \
--rm-tmpdir \
--verbose \
--prep-for-dramv
done

#########################################################################

for file in `ls /PATH_TO_CONTIG_FILES/*.contigs.fa`
do
j=`basename $file .contigs.fa`
VIBRANT_run.py \
-i /PATH_TO_CONTIG_FILES/$j.contigs.fa \
-f nucl \
-l 5000 \
-no_plot \
-folder /PATH_TO_OUTPUT_VB/$j \
-d /PATH_TO_VB_DATABASE/
done

#########################################################################

