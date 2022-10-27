#! /usr/bin/env bash
set -eu;
comm -13 <(
  jq -r 'map( .ident + "@" + .version )[]' ./{SIMPLE,BINS}/locked.json|sort;
) <(
  jq -r 'map( .ident + "@" + .version )[]' "$1"|sort;
)
