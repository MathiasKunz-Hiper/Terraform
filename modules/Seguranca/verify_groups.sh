#!C:\Program Files\Git\git-bash

eval "$(jq -r '@sh "GROUP_NAME=\(.group_name)"')"


$result = az ad group list --display-name $GROUP_NAME


if [[ ${#result} -gt 0 ]]; then
  jq -n --arg exists "" '{exists:"'true'"}'
else
  jq -n --arg exists "" '{exists:"'false'"}'
fi