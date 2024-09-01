#!/bin/bash

#########################################################################
# Description: Binning using metawrap.
# Requires: metawrap v1.3.2, clean reads (*.fastq), and contig files (*.contigs.fa).
#########################################################################

for file in `ls /PATH_TO_CLEAN_READS/*_1.fastq`
do
basename=`basename $file _1.fastq`
metawrap binning \
-o /PATH_TO_OUTPUT/${basename}_binning \
--metabat2 \
--maxbin2 \
--concoct \
-a /PATH_TO_CONTIG/${basename}.contigs.fa \
/PATH_TO_CLEAN_READS/${basename}_1.fastq \
/PATH_TO_CLEAN_READS/${basename}_2.fastq
done

#########################################################################
