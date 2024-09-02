#!/bin/bash

#########################################################################
# Description: Use fastANI to calculate ANI between MAGs.
# Requires: fastANI v1.34 and MAG files (*.MAG.fa).
#########################################################################

readlink -f /PATH_TO_MAG_FILES/*.MAG.fa > MAG_path.txt

fastANI --ql MAG_path.txt --rl MAG_path.txt -o MAG_ANI.txt

#########################################################################
