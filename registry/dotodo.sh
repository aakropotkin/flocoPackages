#! /usr/bin/env bash

export NIX_CONFIG='
warn-dirty = false
';

for d in $( cat ./todo|grep -v '^#'|sort -u; ); do
  mkdir -p "$( dirname "$PWD/result/$d"; )";
  scope="${d%/*}";
  bname="${d#*/}";
  nix eval --impure ".#tlocksTbJSON.$scope.\"$bname.json\"" --raw  \
    > "$PWD/result/$d.json"||                           \
  {
    rm "$PWD/result/$d.json";
    echo "$d" >> bads;
    echo "FAILED: $d" >&2;
    exit 1
  };
done 
