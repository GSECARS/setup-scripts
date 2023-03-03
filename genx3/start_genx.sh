#!/bin/bash

# Load anaconda module
module load python/anaconda-2020.02
source "/software/python-anaconda-2020.02-el7-x86_64/etc/profile.d/conda.sh"

# Activate genx environment
conda activate genxENV

# Start genx3
genx
