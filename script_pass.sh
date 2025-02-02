#!/bin/bash

# Check if the script is being sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "This script must be sourced. Run 'source ${0}' or '. ${0}'"
    exit 1
fi

# Number of DB user's passwords
num_passwords=3 

# Random password
generate_password() {
  local password_length=16
  tr -dc 'A-Za-z0-9!#%&*()_+{}|:<>?=' < /dev/urandom | head -c $password_length
}

# Gen passwords
passwords=()
for ((i=1; i<=num_passwords; i++)); do
  new_password=$(generate_password)
  passwords+=("$new_password")
  #echo "Generated password $i: $new_password"  # Debugging line
done

# Convert the array to a JSON list (needed for terraform to accept)
passwords_json=$(printf '%s\n' "${passwords[@]}" | jq -R . | jq -cs .)

#echo "Compact JSON passwd: $passwords_json" # Debugging line

# Export the JSON as env var
export TF_VAR_db_user_passes="$passwords_json"

# Export admin and readonly passwords
export TF_VAR_admin_user_pass=$(generate_password)
export TF_VAR_readonly_user_pass=$(generate_password)

echo "Generated $num_passwords passwords and exported them as environment variables."


