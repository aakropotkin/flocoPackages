#! /usr/bin/env bash

export NIX_CONFIG='
warn-dirty = false
';

cleanup() {
  if test ./bads; then
    sort -u ./bads > ./bads~;
    mv ./bads~ ./bads;
  fi
  if test ./dones; then
    sort -u ./dones > ./dones~;
    mv ./dones~ ./dones;
  fi
}

for d in $( cat ./todo|grep -v '^#'|sort -u; ); do
  mkdir -p "$( dirname "$PWD/result/$d"; )";
  scope="${d%/*}";
  bname="${d#*/}";
  ldir="@$scope";
  if test "$ldir" = "@unscoped"; then ldir="unscoped"; fi
  echo "$scope/$bname" >&2;
  nix eval --impure ".#tlocksTbJSON.$scope.\"$bname.json\"" --raw  \
    > "$PWD/result/$d.json"||                           \
  {
    rm "$PWD/result/$d.json";
    echo "$d" >> bads;
    echo "FAILED: $d" >&2;
    cleanup;
    exit 1
  };
  if ! test -r "$ldir/$bname.json"; then
    mv "$PWD/result/$d.json" "$ldir/$bname.json";
    git add "$ldir/$bname.json";
  fi
  echo "$d" >> ./dones;
done 
cleanup;
