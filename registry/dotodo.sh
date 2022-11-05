#! /usr/bin/env bash

: "${KEEP_GOING:=}";

while test "$#" -gt 0; do
  case "$1" in
    -t|--tarball)    TARGET="tlocksTbJSON"; ;;
    -k|--keep-going) KEEP_GOING=:; ;;
    *)
      echo "Unrecognized arg: $*" >&2;
      exit 1;
    ;;
  esac
  shift;
done

: "${TARGET:=tlocksJSON}";

export NIX_CONFIG='
warn-dirty = false
';

cleanup() {
  if test -r ./bads; then
    sort -u ./bads > ./bads~;
    mv ./bads~ ./bads;
  fi
  if test -r ./dones; then
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
  nix eval --impure ".#$TARGET.$scope.\"$bname.json\"" --raw  \
    > "$PWD/result/$d.json"||                           \
  {
    rm "$PWD/result/$d.json";
    echo "$d" >> bads;
    echo "FAILED: $d" >&2;
    if test -n "${KEEP_GOING:-}"; then
      continue;
    else
      cleanup;
      exit 1;
    fi
  };
  if ! test -r "$ldir/$bname.json"; then
    mv "$PWD/result/$d.json" "$ldir/$bname.json";
    git add "$ldir/$bname.json";
  fi
  echo "$d" >> ./dones;
done 
cleanup;
