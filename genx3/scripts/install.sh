#!/bin/bash
# clear terminal screen before starting
clear

echo -ne "
----------------------------------------
Preparing anaconda environment for GenX3
----------------------------------------

"

# Load the genx3.conf file
source genx3.conf

# Start time
SECONDS=0
echo -ne "
Anaconda configuration starting

"
# Load the anaconda module
echo "Loading the Anaconda module"
module load "python/$anaconda_module"