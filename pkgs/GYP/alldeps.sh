#! /usr/bin/env bash
_as_me="${BASH_SOURCE[0]##*/}";
SDIR="${BASH_SOURCE%/*}";
: "${FIND:=find}";
: "${XARGS:=xargs}";
: "${JQ:=jq }";
: "${SORT:=sort}";
for tn in $( $FIND "$SDIR" -name tree.nix; ); do
  if ! test -r "${tn%.nix}.json"; then
    echo "$_as_me: Detected $tn without full ${tn%.nix}.json file." >&2;
    exit 1;
  fi
done
$FIND "$SDIR" -name tree.json|$XARGS $JQ -sr '.[][]'|$SORT -u;
