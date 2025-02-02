#!/bin/bash

# <change me>
# Number of PostgreSQL instances
num_instances=5

# Check if the script is being sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "This script must be sourced. Please run 'source ${0}' or '. ${0}'"
    exit 1
fi

# Unset environment variables for each instance
for ((i=1; i<=num_instances; i++)); do
    unset TF_VAR_db_user_passes_$i
    #echo "Unset TF_VAR_db_user_passes_$i"  # Debugging line

    unset TF_VAR_admin_user_pass_$i
    #echo "Unset TF_VAR_admin_user_pass_$i"  # Debugging line

    unset TF_VAR_readonly_user_pass_$i
    #echo "Unset TF_VAR_readonly_user_pass_$i"  # Debugging line
done

echo "All instance-specific env variables unset"


