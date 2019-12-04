#! /bin/bash

set -o nounset
set -o errexit

rp_hash=$(git log -1 --format=%h)
rp_date=$(git log -1 --format=%cd --date=iso-strict)
rp_branch=$(git rev-parse --abbrev-ref HEAD)
echo "$rp_hash;$rp_date;$rp_branch;"
