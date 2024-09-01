#!/bin/bash

#########################################################################
# Description: Species-level clustering of phage sequences using cd-hit.
# Requires: cd-hit v2.3.1 and high confidence phage sequnences merge file (vseq_cv_merge_high_confidence_5k.fa).
#########################################################################

cd-hit-est -c 0.95 -aS 0.85 -T 0 -M 0 -d 0 \
-i /PATH_TO_INPUT/vseq_cv_merge_high_confidence_5k.fa \
-o /PATH_TO_OUTPUT/vseq_cv_merge_high_confidence_5k_dr.fa

#########################################################################
