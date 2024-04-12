#!/usr/bin/env bash

set -e

CURRENT_PATH=$(cd "$(dirname "$0")"; pwd)

# Sync from Rime-ice PATH
if [ -z "$RIMEICE_PATH" ]; then
    echo "rime-ice path is not set"
    exit 0
fi
echo "Sync from: ${RIMEICE_PATH}"


rsync -av ${RIMEICE_PATH}/rime_ice.*.yaml ${CURRENT_PATH}/
rsync -av ${RIMEICE_PATH}/opencc/ ${CURRENT_PATH}/opencc
