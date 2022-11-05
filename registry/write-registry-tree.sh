#! /usr/bin/env bash

set -eu;

SDIR="${BASH_SOURCE[0]%/*}";

: "${NIX:=nix}";
: "${JQ:=jq}";
: "${CHMOD:=chmod}";
: "${CP:=cp}";

: "${SCOPE:=${1:-unscoped}}";

if test "$SCOPE" = "unscoped"; then
  SCOPE="unscoped";
fi

trap 'exit "$?"' HUP EXIT TERM INT QUIT;

case "$SCOPE" in
  --all)
    for s in $( $JQ -r 'keys[]' "$SDIR/npmjs.json"; ); do
      ${BASH_SOURCE[0]} "$s";
    done
    exit 0;
  ;;
  --missing)
    for s in $( $JQ -r 'keys[]' "$SDIR/npmjs.json"; ); do
      if { ! test -d "$SDIR/$s"; } ||
         { test "$s" = "unscoped" && test -d "$SDIR/unscoped"; };
      then
        ${BASH_SOURCE[0]} "$s";
      fi
    done
    exit 0;
  ;;
  unscoped)
    FDIR="$SDIR/result/unscoped";
    TDIR="$SDIR/unscoped";
  ;;
  *)
    FDIR="$SDIR/result/$SCOPE";
    TDIR="$SDIR/@$SCOPE";
  ;;
esac

mkdir -p "$SDIR/result";
$NIX eval --impure -vvv ".#tlocks.$SCOPE" --write-to "$FDIR"||{
  echo "Failed to process: $SCOPE" >&2;
  exit 1;
};

if test -d "$TDIR"; then
  mv "$TDIR" "$TDIR~";
fi

$CP -LRf -- "$FDIR" "$TDIR";
$CHMOD -R +w -- "$TDIR";
