#!/bin/bash

set -e

# Create the socat pipes defined by env vars that start with 'MULTI_SOCAT'
while IFS= read -r socat_args || [[ -n $socat_args ]]; do
  if [ -n "${socat_args}" ]; then
    socat_cmd="socat ${socat_args}"
    echo " >> ${socat_cmd}"
    $(${socat_cmd}) &
  fi
done < <(printf '%s' "$(env | grep ^MULTI_SOCAT | cut -d'=' -f2-)")


sleep 15
while true; do
  if [ "$(pgrep -c 'socat')" -lt 1 ]; then
    echo "ERROR: no socat processes found running, exiting."
    exit 1
  fi
  sleep 30
done
