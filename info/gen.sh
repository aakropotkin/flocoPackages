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
    -G|--no-git) NO_GIT=:; ;;
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
    SCOPE="\"$LDIR\"";
  ;;
  unscoped/*)
    IDENT="$BNAME";
    LDIR="unscoped";
    SCOPE="null";
  ;;
  */*)
    LDIR="@${IDENT%/*}";
    IDENT="@$IDENT";
    SCOPE="\"$LDIR\"";
  ;;
  *)
    LDIR="unscoped";
    SCOPE="null";
  ;;
esac

if test "$LDIR" = unscoped; then
  ODIRR="info/unscoped/${BNAME:0:1}/$BNAME";
  ODIR="$SDIR/unscoped/${BNAME:0:1}/$BNAME";
  ROOT_REL="../../../..";
else
  ODIRR="info/${LDIR#@}/$BNAME";
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
SCOPE:     $SCOPE
BNAME:     $BNAME
SDIR:      $SDIR
TEMPLATE:  $TEMPLATE
TLOCK:     $TLOCK
ODIR:      $ODIR
ODIRR:     $ODIRR
OFILE:     $OFILE
OLFILE:    $OLFILE
EOF
fi

REV="$(
  $NIX eval --impure --raw --expr "let
    packumentRaw = builtins.fetchTree {
      type = \"file\";
      url  = \"https://registry.npmjs.org/$IDENT\";
    };
    packument = builtins.fromJSON ( builtins.readFile packumentRaw );
  in if packument ? _rev then \"?_rev=\${packument._rev}\" else \"\"
  ";
)";

IDENT_ESC="${IDENT/\//%2f}";
# Yes it is `.com' NOT `.org'.
SKIM_URL="https://skimdb.npmjs.com/registry/$IDENT_ESC$REV"

PACKUMENT_NAR="$(
  $NIX flake prefetch --json "$SKIM_URL"|$JQ -r '.hash';
)";

gen_flake() {
  $SED                               \
    -e "s,@IDENT@,$IDENT,g"          \
    -e "s,@ODIRR@,$ODIRR,g"          \
    -e "s,@SCOPE@,$SCOPE,g"          \
    -e "s,@SKIM_URL@,$SKIM_URL,g"    \
    "$TEMPLATE"                      \
  > "$OFILE";
}

gen_lock() {
  $SED                                       \
    -e "s,@PACKUMENT_NAR@,$PACKUMENT_NAR,g"  \
    -e "s,@SKIM_URL@,$SKIM_URL,g"            \
    "$LTEMPLATE"                             \
  > "$OLFILE";
}


$MKDIR -p "$ODIR";
if test -r "$OFILE"; then
  echo "Backing up existing flake.nix to flake.nix~" >&2;
  mv "$OFILE" "$OFILE~";
fi
gen_flake;

if test -r "$OLFILE"; then
  echo "Backing up existing flake.lock to flake.lock~" >&2;
  mv "$OLFILE" "$OLFILE~";
fi
gen_lock;

if test -z "${NO_GIT:+y}"; then
  $GIT add "$OFILE" "$OLFILE";
fi
