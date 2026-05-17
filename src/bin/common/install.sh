#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

"${SCRIPT_DIR}"/01-sanitize.sh
"${SCRIPT_DIR}"/02-rust.sh
"${SCRIPT_DIR}"/03-kustomize.sh
