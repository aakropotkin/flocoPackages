#! /usr/bin/env bash

set -eu;

: "${REALPATH:=realpath}";
: "${SED:=sed}";
: "${MKDIR:=mkdir}";
: "${GIT:=git}";
: "${NIX:=nix}";
: "${CAT:=cat}";
: "${JQ:=jq}";

SDIR="${BASH_SOURCE[0]%/*}";
SDIR="$( $REALPATH "$SDIR"; )";
TEMPLATE="$SDIR/flake.nix.in";
LTEMPLATE="$SDIR/flake.lock.in";

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
OLFILE="$ODIR/flake.lock";
TLOCK="$SDIR/../registry/$LDIR/$BNAME.json";


if test -n "${VERBOSE:+y}"; then
  $CAT <<EOF
IDENT:     $IDENT
LDIR:      $LDIR
ROOT_REL:  $ROOT_REL
BNAME:     $BNAME
SDIR:      $SDIR
TEMPLATE:  $TEMPLATE
TLOCK:     $TLOCK
ODIR:      $ODIR
OFILE:     $OFILE
OLFILE:    $OLFILE
EOF
fi


if test -r "$TLOCK"; then
  LOCK_NAR="$( $NIX hash file --sri --type sha256 "$TLOCK"; )";
else
  echo "WARNING: No treeLock exists for $IDENT" >&2;
  NO_TLOCK=:;
fi


gen_flake() {
  $SED                             \
    -e "s,@IDENT@,$IDENT,g"        \
    -e "s,@ROOT_REL@,$ROOT_REL,g"  \
    -e "s,@LDIR@,$LDIR,g"          \
    -e "s,@BNAME@,$BNAME,g"        \
    "$TEMPLATE"                    \
  > "$OFILE";
}

gen_lock() {
  $SED                             \
    -e "s,@IDENT@,$IDENT,g"        \
    -e "s,@ROOT_REL@,$ROOT_REL,g"  \
    -e "s,@LDIR@,$LDIR,g"          \
    -e "s,@BNAME@,$BNAME,g"        \
    -e "s,@LOCK_NAR@,$LOCK_NAR,g"  \
    "$LTEMPLATE"                   \
  > "$OLFILE";
}


$MKDIR -p "$ODIR";
if test -r "$OFILE"; then
  echo "Backing up existing flake.nix to flake.nix~" >&2;
  mv "$OFILE" "$OFILE~";
fi
gen;
$GIT add "$OFILE";

gen_lock;
if test -z "${NO_TLOCK:+y}"; then
  echo "Dropping treeLock from generated flake.lock ( no treLock exists )" >&2;
  $JQ '.nodes|=del( .treeLock )' "$OLFILE";
fi
$GIT add "$OLFILE";

FLAKE_URI="./$( $REALPATH --relative-base "$SDIR" "$ODIR"; )";

#$NIX flake                   \
#  --option warn-dirty false  \
#  lock "$FLAKE_URI"          \
#  --commit-lock-file         \
#;
#
#if test -z "${NO_TLOCK:+y}"; then
#  $GIT add "$ODIR/flake.lock";
#fi
