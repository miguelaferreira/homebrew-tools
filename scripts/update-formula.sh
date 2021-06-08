#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

formula="${1}"
version="${2}"
sha="${3}"

[[ -z "${formula}" ]] && exit 1
[[ -z "${version}" ]] && exit 1
[[ -z "${sha}" ]] && exit 1


 sed -E -i \
    -e "s/v[0-9]+.[0-9]+.[0-9]+/${version}/g" \
    -e "s/sha256 \"[0-9a-z]+\"/sha256 \"${sha}\"/" \
    "${formula}"
