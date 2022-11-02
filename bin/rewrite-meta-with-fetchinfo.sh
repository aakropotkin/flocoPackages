#! /usr/bin/env bash
# Functional Draft.
# Needs to be made into robust script.
# Rewrites `meta.json' `sourceInfo' fields with optimized `fetchInfo'.
jq '
with_entries(
  .key as $key|
  ( $fi|flatten|add ) as $fetchInfo|
  .value.sourceInfo|=(
    del(.hash)|
    del(.sha512)|
    .+=$fechtInfo[$key]
  )
)' --slurpfile fi "${1%/meta.json}/fetchInfo.json" "${%/meta.json}/meta.json";
