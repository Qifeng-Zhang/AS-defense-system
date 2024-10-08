#!/bin/bash

#########################################################################
# Description: Use checkv (CV) to filter the phage sequences generated by VS2 and VB to obtain high-confidence phage sequences.
# Requires: checkv v2.3.1, seqkit v2.3.1 and phage sequnences merge file (vseq_before_cv_merge.fa).
#########################################################################

checkv end_to_end \
/PATH_TO_PHAGE_SEQ_BEFORE_CV/vseq_before_cv_merge.fa \
/PATH_TO_OUTPUT_CV/ \
-d /PATH_TO_CV_DATABASE/

#########################################################################

cat /PATH_TO_OUTPUT_CV/proviruses.fna /PATH_TO_OUTPUT_CV/viruses.fna > /PATH_TO_OUTPUT_CV/vseq_cv_merge.fa

#########################################################################

awk -F "\t" '{
    if (($6 - 5 * $7) > 0 && $10 > 50) {
        print $1
    }
}' /PATH_TO_OUTPUT_CV/quality_summary.tsv > /PATH_TO_OUTPUT_CV/cv_high_confidence_id.tsv

#########################################################################

seqkit grep -f /PATH_TO_OUTPUT_CV/cv_high_confidence_id.tsv /PATH_TO_OUTPUT_CV/vseq_cv_merge.fa -o /PATH_TO_OUTPUT_CV/vseq_cv_merge_high_confidence.fa
seqkit seq -m 5000 /PATH_TO_OUTPUT_CV/vseq_cv_merge_high_confidence.fa -o /PATH_TO_OUTPUT_CV/vseq_cv_merge_high_confidence_5k.fa

#########################################################################
