#!/usr/bin/env bash

CURRENT_PATH=$(cd "$(dirname "$0")"; pwd)

# Sync from Rime-ice PATH
if [ -z "$RIMEICE_PATH" ]; then
    echo "rime-ice path is not set"
    exit 0
fi
if [ -z "$RIMECAN_PATH" ]; then
    echo "rime-cantonese path is not set"
    exit 0
fi
echo "Sync from: ${RIMEICE_PATH}"

(cd ${RIMEICE_PATH} && proxychains git pull)
rsync -av ${RIMEICE_PATH}/rime_ice.*.yaml ${CURRENT_PATH}/
rsync -av ${RIMEICE_PATH}/melt_eng.*.yaml ${CURRENT_PATH}/
rsync -av ${RIMEICE_PATH}/radical_pinyin.*.yaml ${CURRENT_PATH}/
rsync -av ${RIMEICE_PATH}/double_pinyin*.schema.yaml ${CURRENT_PATH}/
rsync -av ${RIMEICE_PATH}/t9.schema.yaml ${CURRENT_PATH}/
rsync -av ${RIMEICE_PATH}/symbols_*.yaml ${CURRENT_PATH}/
rsync -av ${RIMEICE_PATH}/default.yaml ${CURRENT_PATH}/

rsync -av ${RIMEICE_PATH}/rime.lua ${CURRENT_PATH}/
rsync -av ${RIMEICE_PATH}/lua/ ${CURRENT_PATH}/lua

rsync -av ${RIMEICE_PATH}/opencc/ ${CURRENT_PATH}/opencc
rsync -av ${RIMEICE_PATH}/cn_dicts/ ${CURRENT_PATH}/cn_dicts
rsync -av ${RIMEICE_PATH}/en_dicts/ ${CURRENT_PATH}/en_dicts

(cd ${RIMECAN_PATH} && proxychains git pull)
rsync -av ${RIMECAN_PATH}/opencc/ ${CURRENT_PATH}/opencc
rsync -av ${RIMECAN_PATH}/symbols_cantonese.yaml ${CURRENT_PATH}/symbols_cantonese.yaml
rsync -av ${RIMECAN_PATH}/essay-cantonese.txt ${CURRENT_PATH}/essay-cantonese.txt
rsync -av ${RIMECAN_PATH}/jyut6ping3*.yaml ${CURRENT_PATH}/

(cd ${CURRENT_PATH}; git add *; git commit -m "merge from rime-ice"; git push origin main)
