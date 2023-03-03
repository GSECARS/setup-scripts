#!/bin/bash

# Load the genx3.conf file
source genx3.conf

# Target file names
genx3_file_name="start_genx3.sh"
sbatch_file_name="sbatch_genx3.example.sh"

# Copy and rename the template files
cp "templates/start_genx3.template" "$genx3_file_name"
cp "templates/sbatch_genx3.example.template" "$sbatch_file_name"

# Change the contents of the GenX3 start file with the correct values
sed -i "s|module load|module load python/$anaconda_module|g" "$genx3_file_name"
sed -i "s|source|source '/software/python-$anaconda_module-el7-x86_64/etc/profile.d/conda.sh'|g" "$genx3_file_name"
sed -i "s|conda activate|conda activate $environment_name|g" "$genx3_file_name"

# Change the contents of the GenX3 SBATCH file with the correct values
sed -i "s|module load|module load python/$anaconda_module|g" "$sbatch_file_name"
sed -i "s|source|source '/software/python-$anaconda_module-el7-x86_64/etc/profile.d/conda.sh'|g" "$sbatch_file_name"
sed -i "s|conda activate|conda activate $environment_name|g" "$sbatch_file_name"

# Make the executables
chmod +x "$genx3_file_name" "$sbatch_file_name"