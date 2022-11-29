#!/bin/bash
# clear terminal screen before starting
clear

echo -ne "
----------------------------------------
Preparing anaconda environment for GenX3
----------------------------------------

"

# [ Anaconda Module ]
read -rp "Enter the anaconda module name, leave empty for default (python/anaconda-2020.02): " module_name
if [ -z "$module_name" ]; then
    module_name="python/anaconda-2020.02"
fi
anaconda_module=$(echo "$module_name" | cut -c 8-)

# [ Anaconda Environment ]
# conda.sh
source "/software/python-$anaconda_module-el7-x86_64/etc/profile.d/conda.sh"

# envs directory path
anaconda_envs_path="$HOME/.conda/envs"

# get environment name
read -rp "Enter the environment name, leave empty for default (genxENV): " environment_name
if [ -z "$environment_name" ]; then
    environment_name="genxENV"
fi

# create full path for the environment
full_environment_path="$anaconda_envs_path/$environment_name"

# terminate if the environment exists
if [ -d "$full_environment_path" ];
then
    echo -ne "The environment '$environment_name' already exists. Aborting..."
    sleep 1
    exit 0
fi

# get python version
read -rp "Enter the python version, leave empty for default (3.9): " python_version
if [ -z "$python_version" ]; then
    python_version="3.9"
fi

# anaconda packages
read -rp "Enter anaconda packages, leave empty for default (mpi4py wxpython=4.1.1): " anaconda_packages
if [ -z "$anaconda_packages" ]; then
    anaconda_packages="mpi4py wxpython=4.1.1"
fi

# pypi packages
read -rp "Enter PYPI packages, leave empty for default (matplotlib appdirs h5py scipy numba psutil pymysql vtk genx3): " pypi_packages
if [ -z "$pypi_packages" ]; then
    pypi_packages="matplotlib appdirs h5py scipy numba psutil pymysql vtk genx3"
fi

# get custom model
read -rp "Enter custom model path, leave empty for default (/project2/jstubbs1/data/chris/genx3/sxrd_uanis_nopseudo.py): " custom_model
if [ -z "$custom_model" ]; then
    custom_model="/project2/jstubbs1/data/chris/genx3/sxrd_uanis_nopseudo.py"
fi

# Start time
SECONDS=0
echo -ne "
Anaconda configuration starting

"
sleep 1

# Load the anaconda module
module load "$module_name"

# Enable conda-forge
conda config --add channels conda-forge

# Create the environment
conda create -n "$environment_name" python="$python_version" $anaconda_packages --yes
# > /dev/null

# Activate the environment
conda activate "$environment_name"

# Update pip
pip install -U pip setuptools

# Install pypi packages
pip install $pypi_packages

# Add custom model
cp $custom_model "$HOME/.conda/envs/$environment_name/lib/python$python_version/site-packages/genx/models"

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
