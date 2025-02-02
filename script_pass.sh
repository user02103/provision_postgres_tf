#!/bin/bash

# Check if the script is being sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "This script must be sourced. Run 'source ${0}' or '. ${0}'"
    exit 1
fi

# <change me>
# Number of PostgreSQL instances
num_instances=5

# Number of DB user's passwords per instance
num_passwords=3

# Random password
generate_password() {
    local password_length=16
    tr -dc 'A-Za-z0-9!#%&*()_+{}|:<>?=' < /dev/urandom | head -c $password_length
}

# Gen passwords
for ((instance=1; instance<=num_instances; instance++)); do
    passwords=()
    for ((i=1; i<=num_passwords; i++)); do
        new_password=$(generate_password)
        passwords+=("$new_password")
        #echo "Generated password $i for instance $instance: $new_password"  # Debugging line
    done

    # Convert the array to a JSON list (needed for terraform to accept)
    passwords_json=$(printf '%s\n' "${passwords[@]}" | jq -R . | jq -cs .)

    #echo ""Compact JSON passwd for instance $instance: $passwords_json" # Debugging line

    # Export the JSON as env var
    export TF_VAR_db_user_passes_$instance="$passwords_json"

    #echo "Exported TF_VAR_db_user_passes_$instance" # Debugging line
done

# Generate and export admin passwords for each instance
for ((i=1; i<=num_instances; i++)); do
    password=$(generate_password)
    export TF_VAR_admin_user_pass_$i="$password"
    #echo "Exported TF_VAR_admin_user_pass_$i: $password"  # Debugging line
done

# Generate and export readonly user passwords for each instance
for ((i=1; i<=num_instances; i++)); do
    password=$(generate_password)
    export TF_VAR_readonly_user_pass_$i="$password"
    #echo "Exported TF_VAR_readonly_user_pass_$i: $password"  # Debugging line
done


