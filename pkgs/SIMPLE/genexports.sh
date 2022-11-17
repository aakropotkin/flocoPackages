#! /usr/bin/env bash
: "${REALPATH:=realpath}";
: "${SORT:=sort}";
: "${JQ:=jq}";
SPATH="$( $REALPATH ${BASH_SOURCE[0]}; )";
SDIR="${SPATH%/*}";
GENSCRIPTS=(
  "$SDIR/../BINS/alldeps.sh"
  "$SDIR/../INST/alldeps.sh"
  "$SDIR/../GYP/alldeps.sh"
);

for gs in "${GENSCRIPTS[@]}"; do
  if test -x "$gs"; then
    "$gs";
  fi
done|$SORT -u|$JQ -Rs 'split( "\n" )|map( select( . != "" ) )';
