#!/bin/bash

# [ Configuration File ]
config_file=genx3.conf
if [ ! -f "$config_file" ]; then
    # Create the config file
    touch "$config_file"
fi

# [ Anaconda Module ]
read -rp "Enter the anaconda module name, leave empty for default (anaconda-2020.02): " anaconda_module
if [ -z "$anaconda_module" ]; then
    anaconda_module="anaconda-2020.02"
fi

# Add anaconda module name to the config file
if grep -qF "anaconda_module" "$config_file"; then
    # Replace the existing value
    sed -i "/^anaconda_module=/c\\anaconda_module=$anaconda_module" "$config_file"
else
    # Add the anaconda module name
    echo "anaconda_module=$anaconda_module" >> "$config_file"
fi

# [ Environment Name ]
read -rp "Enter the environment name, leave empty for default (genxENV): " environment_name
if [ -z "$environment_name" ]; then
    environment_name="genxENV"
fi

# Add environment name to the config file
if grep -qF "environment_name" "$config_file"; then
    # Replace the existing value
    sed -i "/^environment_name=/c\\environment_name=$environment_name" "$config_file"
else
    # Add the environment name
    echo "environment_name=$environment_name" >> "$config_file"
fi

# [ Python Version ]
read -rp "Enter the python version, leave empty for default (3.9): " python_version
if [ -z "$python_version" ]; then
    python_version="3.9"
fi

# Add python version to the config file
if grep -qF "python_version"= "$config_file"; then
    # Replace the existing value
    sed -i "/^python_version=/c\\python_version=$python_version" "$config_file"
else
    # Add the python version
    echo "python_version=$python_version" >> "$config_file"
fi

# [ Anaconda Packages ]
read -rp "Enter anaconda packages, leave empty for default (mpi4py=3.1.2 wxpython=4.1.1): " anaconda_packages
if [ -z "$anaconda_packages" ]; then
    anaconda_packages="mpi4py=3.1.2 wxpython=4.1.1"
fi

# Add anaconda packages to the config file
if grep -qF "anaconda_packages"= "$config_file"; then
    # Replace the existing value
    sed -i "/^anaconda_packages=/c\\anaconda_packages='$anaconda_packages'" "$config_file"
else
    # Add the anaconda packages
    echo "anaconda_packages='$anaconda_packages'" >> "$config_file"
fi

# [ PyPI Packages ]
read -rp "Enter PyPI packages, leave empty for default (matplotlib appdirs h5py scipy numba psutil pymysql vtk genx3): " pypi_packages
if [ -z "$pypi_packages" ]; then
    pypi_packages="matplotlib appdirs h5py scipy numba psutil pymysql vtk genx3"
fi

# Add PyPI packages to the config file
if grep -qF "pypi_packages"= "$config_file"; then
    # Replace the existing value
    sed -i "/^pypi_packages=/c\\pypi_packages='$pypi_packages'" "$config_file"
else
    # Add the PyPI packages
    echo "pypi_packages='$pypi_packages'" >> "$config_file"
fi

# [ Custom GenX3 Model ]
read -rp "Enter custom GenX3 model directory or file path, leave empty for default (models): " custom_model_path
if [ -z "$custom_model_path" ]; then
    custom_model_path="models"
fi

# Add custom GenX3 model path to the config file
if grep -qF "custom_model_path"= "$config_file"; then
    # Replace the existing value
    sed -i "/^custom_model_path=/c\\custom_model_path=$custom_model_path" "$config_file"
else
    # Add the custom GenX3 model path
    echo "custom_model_path=$custom_model_path" >> "$config_file"
fi