#!/bin/bash

#########################################################################
# Description: Using phylophlan to construct a phylogenetic tree of MAGs.
# Requires: phylophlan v3.1.1 and MAG files (*.MAG.fa).
#########################################################################

phylophlan \
-i /PATH_TO_MAG_FILES/*.MAG.fa \
--output_folder /PATH_TO_OUTPUT_TREE/ \
-d phylophlan \
--databases_folder /PATH_TO_PHYLOPHLAN_DATABASE/ \
-f /PATH_TO_CFG/supermatrix_aa.cfg \
--genome_extension .fa \
--diversity high \
--verbose

#########################################################################
