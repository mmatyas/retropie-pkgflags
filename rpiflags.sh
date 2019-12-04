#! /bin/bash

set -o nounset
set -o errexit

function grep_for() {
  local filepath=$1
  local key=$2
  grep $key $filepath | head -n 1 | sed -En 's/^[a-z_]+="(.+?)"/\1/p'
}

for dir in emulators libretrocores ports supplementary; do
  for sh in scriptmodules/$dir/*.sh; do
    rpid=$(grep_for $sh rp_module_id)
    rpdesc=$(grep_for $sh rp_module_desc)
    rpflags=$(grep_for $sh rp_module_flags)
    rpsection=$(grep_for $sh rp_module_section)
    echo "$rpsection;$rpid;$rpdesc;$rpflags;"
  done
done
