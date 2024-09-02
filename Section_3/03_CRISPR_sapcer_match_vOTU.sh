#!/bin/bash

#########################################################################
# Description: Matching CRISPR spacers and vOTUs using blastn.
# Requires: blast v2.3.1, CRISPR spacer files (Spacers_total_dr.fasta), and de-redundancy high confidence phage sequnences merge file (vseq_cv_merge_high_confidence_5k_dr.fa).
#########################################################################

makeblastdb \
-in /PATH_TO_CRASS_FILES/Spacers_dr/Spacers_total_dr.fasta \
-input_type fasta \
-dbtype nucl \
-title Spacers_total_dr \
-out /PATH_TO_BLAST_FILES/Spacers_DC_b_dr

blastn -query /PATH_TO_vOTUs/vseq_cv_merge_high_confidence_5k_dr.fa \
-out /PATH_TO_BLAST_FILES/Spacer_vOTU.blast \
-db /PATH_TO_BLAST_FILES/Spacers_DC_b_dr \
-outfmt 6 \
-evalue 1e-5 \
-perc_identity 95 \

#########################################################################
