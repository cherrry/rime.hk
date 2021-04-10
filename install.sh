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
"${DIR}/plum/rime-install" "cangjie" "cantonese"

RIME_DIR="${HOME}/.config/ibus/rime"
if [ `uname` == "Darwin" ]; then
  RIME_DIR="${HOME}/Library/Rime"
fi
mkdir -p "${RIME_DIR}"

SYMLINK_CONFIGS=(
  "cangjie5.cj3ext.dict.yaml"
  "cangjie5.custom.yaml"
  "cangjie5.traditional.dict.yaml"
  "default.custom.yaml"
  "jyut6ping3.clean.dict.yaml"
  "jyut6ping3.custom.yaml"
  "kana.dict.yaml"
  "souketsu.dict.yaml"
  "squirrel.custom.yaml"
)
for file in "${SYMLINK_CONFIGS[@]}"; do
  symlink "${DIR}/config/${file}" "${RIME_DIR}/${file}"
done

echo "Please manually deploy rime again."
