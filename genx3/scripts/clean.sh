#!/bin/bash
# clear terminal screen before starting
clear

echo -ne "
----------------------------------
GenX3 anaconda environment cleanup
----------------------------------

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
    # Start time
    SECONDS=0
    echo "Anaconda configuration starting"
    sleep 1

    # Load the anaconda module
    module load "$module_name"

    # Activate the environment
    conda deactivate

    # Remove the environment
    conda env remove -n "$environment_name"

    # Elapsed time
    elapsed=$SECONDS
    echo -ne "

    Elapsed time: $(($elapsed / 60)) minutes and $(($elapsed % 60)) seconds
    "
else
    echo -ne "The environment '$environment_name' doesn't exist. Aborting..."
    sleep 1
    exit 0
fi

# Remove any existing environment files
rm -rf "$HOME/.conda/envs/$environment_name"
