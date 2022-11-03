#! /usr/bin/env bash

# Functional Draft.
# Needs to be made into robust script.
# Rewrites `meta.json' `fetchInfo' fields with optimized `fetchInfo'.

set -x

: "${JQ:=jq}";
: "${NIX:=nix}";

if test "$#" -gt 0; then
  PDIR="${1%/meta.*}";
else
  PDIR="$PWD";
fi

if ! test -r "$PDIR/fetchInfo.json"; then
  "${BASH_SOURCE[0]%/*}/genFetchInfoFromMS" -s $PDIR/meta.*  \
    > "$PDIR/fetchInfo.json";
fi

if ! test -r "$PDIR/meta.json"; then
  $NIX eval --impure --json -f $PDIR/meta.nix > "$PDIR/meta.json";
fi


$JQ '
with_entries(
  .key as $key|
  ( $fi|flatten|add ) as $fetchInfo|
  .value.fetchInfo|=(
    del(.hash)|
    del(.sha512)|
    .+=$fetchInfo[$key]
  )
)' --slurpfile fi "$PDIR/fetchInfo.json" "$PDIR/meta.json";
