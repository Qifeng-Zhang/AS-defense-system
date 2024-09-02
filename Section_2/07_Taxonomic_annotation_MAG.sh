#!/bin/bash

#########################################################################
# Description: Taxonomic annotation of MAGs using gtdb-tk.
# Requires: gtdb-tk v2.3.2 and MAG files (*.MAG.fa).
#########################################################################

gtdbtk identify \
--genome_dir /PATH_TO_MAG_FILES/*.MAG.fa \
--out_dir /PATH_TO_OUTPUT_GTDBTK/ \
--extension fa \

gtdbtk align \
--identify_dir /PATH_TO_OUTPUT_GTDBTK/ \
--out_dir /PATH_TO_OUTPUT_GTDBTK/ \

gtdbtk classify \
--genome_dir /PATH_TO_MAG_FILES/*.MAG.fa \
--align_dir /PATH_TO_OUTPUT_GTDBTK/ \
--out_dir /PATH_TO_OUTPUT_GTDBTK/ \
-x fa \
--skip_ani_screen \

#########################################################################
