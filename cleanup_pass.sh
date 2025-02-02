#!/bin/bash

# Check if the script is being sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "This script must be sourced. Please run 'source ${0}' or '. ${0}'"
    exit 1
fi

unset TF_VAR_db_user_passes
unset TF_VAR_admin_user_pass
unset TF_VAR_readonly_user_pass

echo "Env variables unset."

