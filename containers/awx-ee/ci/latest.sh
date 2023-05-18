#!/usr/bin/env bash
channel=$1
version=$(curl -X GET "https://quay.io/api/v1/repository/ansible/awx-ee/tag/" | jq --raw-output --arg s "22.3.0" '.tags[] | select(.name | contains($s))| .name' 2>/dev/null | head -n1)
version="${version#*v}"
version="${version#*release-}"
version="${version%_*}"
printf "%s" "${version}"