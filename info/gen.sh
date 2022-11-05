#! /usr/bin/env bash

set -eu;

: "${REALPATH:=realpath}";
: "${SED:=sed}";
: "${MKDIR:=mkdir}";
: "${GIT:=git}";
: "${NIX:=nix}";
: "${CAT:=cat}";

SDIR="${BASH_SOURCE[0]%/*}";
SDIR="$( $REALPATH "$SDIR"; )";
TEMPLATE="$SDIR/flake.nix.in";

while test "$#" -gt 0; do
  case "$1" in
    *-)
      echo "Unrecognized flag: $*" >&2;
      exit 1;
    ;;
    *)
      IDENT="$1";
    ;;
  esac
  shift;
done

if test -z "${IDENT:-}"; then
  echo "You must provide a package identifier/name" >&2;
  exit 1;
fi

BNAME="${IDENT#*/}";

case "$IDENT" in
  @*/*)
    LDIR="${IDENT%/*}";
  ;;
  unscoped/*)
    IDENT="$BNAME";
    LDIR="unscoped";
  ;;
  */*)
    LDIR="@${IDENT%/*}";
    IDENT="@$IDENT";
  ;;
  *)
    LDIR="unscoped";
  ;;
esac

if test "$LDIR" = unscoped; then
  ODIR="$SDIR/unscoped/${LDIR[1]}/$BNAME";
  ROOT_REL="../../../..";
else
  ODIR="$SDIR/${LDIR#@}/$BNAME";
  ROOT_REL="../../..";
fi
OFILE="$ODIR/flake.nix";


if test -n "${VERBOSE:+y}"; then
  $CAT <<EOF
IDENT:     $IDENT
LDIR:      $LDIR
ROOT_REL:  $ROOT_REL
BNAME:     $BNAME
SDIR:      $SDIR
TEMPLATE:  $TEMPLATE
ODIR:      $ODIR
OFILE:     $OFILE
EOF
fi


if ! test -r "$SDIR/../registry/$LDIR/$BNAME.json"; then
  echo "WARNING: No treeLock exists for $IDENT" >&2;
  NO_TLOCK=:;
fi


gen() {
  $SED                             \
    -e "s,@IDENT@,$IDENT,g"        \
    -e "s,@ROOT_REL@,$ROOT_REL,g"  \
    -e "s,@LDIR@,$LDIR,g"          \
    -e "s,@BNAME@,$BNAME,g"        \
    "$TEMPLATE"                    \
  > "$OFILE";
}


$MKDIR -p "$ODIR";
if test -r "$OFILE"; then
  echo "Backing up existing flake.nix to flake.nix~" >&2;
  mv "$OFILE" "$OFILE~";
fi
gen;
$GIT add "$OFILE";
$NIX flake lock "./$( $REALPATH --relative-base "$SDIR" "$ODIR"; )";
if test -z "${NO_TLOCK:+y}"; then
  $GIT add "$ODIR/flake.lock";
fi
