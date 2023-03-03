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

# Anaconda environment
echo "Setting up anaconda environment?"
# conda.sh
source "/software/python-$anaconda_module-el7-x86_64/etc/profile.d/conda.sh"
# envs directory path
anaconda_envs_path="$HOME/.conda/envs"
# create full path for the environment
full_environment_path="$anaconda_envs_path/$environment_name"
# terminate if the environment exists
if [ -d "$full_environment_path" ];
then
    echo -ne "The environment '$environment_name' already exists. Aborting..."
    sleep 1
    exit 0
fi

# Load the anaconda module
echo "Loading the Anaconda module"
module load "python/$anaconda_module"

# Enable conda-forge
echo "Enable conda-forge"
conda config --add channels conda-forge

# Create the environment
conda create -n "$environment_name" python="$python_version" $anaconda_packages --yes

# Activate the environment
conda activate "$environment_name"

# Update pip
pip install -U pip setuptools

# Install pypi packages
pip install $pypi_packages

# Add custom models
models_dir="$HOME/.conda/envs/$environment_name/lib/python$python_version/site-packages/genx/models"
if [ -f "$custom_model_path" ]; then
  # Copy the model file
  cp "$custom_model_path" "$models_dir"
elif [ -d "$custom_model_path" ]; then
  # Copy the directory of models
  cp -r "$custom_model_path/*" "$models_dir"
else
  # No custom models message!
  echo "No custom models added!"
fi

# Elapsed time
elapsed=$SECONDS
echo -ne "

Elapsed time: $(($elapsed / 60)) minutes and $(($elapsed % 60)) seconds
"

# Autostart
read -rp "Do you want to start GenX3? [Y/n] " selection

if [ -z "$selection" ]; then
    selection="y"
fi

case $selection in
    [yY][eE][sS]|[yY])
        genx
        ;;
    [nN][oO]|[nN])
        ;;
    *)
esac