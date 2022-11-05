#! /usr/bin/env bash

: "${KEEP_GOING:=}";
: "${GREP:=grep}";
: "${NIX:=nix}";
: "${CAT:=cat}";
: "${SORT:=sort}";
: "${GIT:=git}";
: "${REALPATH:=realpath}";
: "${MKDIR:=mkdir}";

SPATH="$( $REALPATH "${BASH_SOURCE[0]}"; )";
SDIR="${SPATH%/*}";

usage() {
  $CAT <<EOF
dotodo [--tarball|--keep-going|--file FILE]...
Process 'todo' file ( or FILE ) creating treeLocks for the listed packages.
Completed packages will be added to the 'dones' file list.
Failed packages will be added to the 'bads' file list.
Successfully generated treeLocks will automatically overwrite existing locks.

OPTIONS
  -t,--tarball      Fetch tarballs by default. Does not override 'typeFor'.
  -k,--keep-going   Do not exit if generating a treeLock fails.
  -f,--file         Use FILE as 'todo' file.
  -C,--no-clobber   Do not overwrite existing files. Write to './result/*'.
EOF
}

while test "$#" -gt 0; do
  case "$1" in
    -t|--tarball)    TARGET="tlocksTbJSON"; ;;
    -k|--keep-going) KEEP_GOING=:; ;;
    -C|--no-clobber) NO_CLOBBER=:; ;;
    -f|--file)       TODOS:="$1"; shift; ;;
    -h|--help)       usage; exit 0; ;;
    *)
      echo "Unrecognized arg: $*" >&2;
      exit 1;
    ;;
  esac
  shift;
done

: "${TARGET:=tlocksJSON}";
: "${TODOS:=todo}";

export NIX_CONFIG='
warn-dirty = false
';

cleanup() {
  if test -r ./bads; then
    $SORT -u ./bads > ./bads~;
    mv ./bads~ ./bads;
  fi
  if test -r ./dones; then
    $SORT -u ./dones > ./dones~;
    mv ./dones~ ./dones;
  fi
}

for d in $( $CAT ./todo|$GREP -v '^#'|$SORT -u; ); do
  case "$d" in
    */*)
      scope="${d%/*}";
      scope="${scope#@}";
      ident="@$scope/${d#*/}";
    ;;
    *)
      ident="$d";
    ;;
  esac
  : "${scope:=unscoped}";
  bname="${d#*/}";
  ldir="@$scope";
  if test "$ldir" = "@unscoped"; then ldir="unscoped"; fi
  ofile="$PWD/result/$ldir/$bname.json";
  efile="$SDIR/$ldir/$bname.json";

  echo "$ident" >&2;
  $MKDIR -p "${ofile%/*}";

  $NIX eval --impure ".#$TARGET.$scope.\"$bname.json\"" --raw > "$ofile"||  \
  {
    rm "$ofile";
    echo "$scope/$bname" >> bads;
    echo "FAILED: $ident" >&2;
    if test -n "${KEEP_GOING:-}"; then
      continue;
    else
      cleanup;
      exit 1;
    fi
  };
  if test -z "${NO_CLOBBER:+y}"; then
    $MKDIR -p "${efile%/*}";
    mv "$ofile" "$efile";
    $GIT add "$efile";
  fi
  echo "$scope/$bname" >> ./dones;
done 
cleanup;
