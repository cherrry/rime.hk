#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "${DIR}"

symlink() {
  local src="$1"
  local dest="$2"
  echo "Symlink ${dest} -> ${src}"
  mkdir -p "$(dirname ${dest})"
  rm -rf "${dest}"
  ln -s "${src}" "${dest}"
}

git clone https://github.com/rime/plum.git
cd "${DIR}/plum"
"${DIR}/plum/rime-install" "cherrry/rime-cangjie" "cantonese"

RIME_DIR="${HOME}/.config/ibus/rime"
if [ `uname` == "Darwin" ]; then
  RIME_DIR="${HOME}/Library/Rime"
fi
mkdir -p "${RIME_DIR}"

CONFIG_DIR="${DIR}/config"
symlink "${CONFIG_DIR}/cangjie5.cj3ext.dict.yaml" "${RIME_DIR}/cangjie5.cj3ext.dict.yaml"
symlink "${CONFIG_DIR}/cangjie5.custom.yaml" "${RIME_DIR}/cangjie5.custom.yaml"
symlink "${CONFIG_DIR}/default.custom.yaml" "${RIME_DIR}/default.custom.yaml"
symlink "${CONFIG_DIR}/jyut6ping3.custom.yaml" "${RIME_DIR}/jyut6ping3.custom.yaml"
symlink "${CONFIG_DIR}/squirrel.custom.yaml" "${RIME_DIR}/squirrel.custom.yaml"

echo "Please manually deploy rime again."
