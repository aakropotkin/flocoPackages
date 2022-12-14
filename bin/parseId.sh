#! /usr/bin/env bash
# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

shopt -s extglob;

# Tools
: "${NIX:=nix}";
: "${CAT:=cat}";


# Options
: "${VERBOSE:=}";


# Vars
SCOPE='unscoped';
VERSION='';
ORIG="$*";
ARGI=0;


# ---------------------------------------------------------------------------- #

# plog MSG...
# Print MSG to STDERR if VERBOSE is enabled.
# Otherwise do nothing.
if test -n "$VERBOSE"; then
  plog() { echo "$*" >&2; }
else
  plog() { :; }
fi


# perror MSG...
# Print Error
perror() { echo "ERROR: $*" >&2; }


# die [EXIT-CODE:=1] [MSG...]
die() {
  local _es;
  # Set Exit Code
  case "$1" in
    +([0-9])) _es="$1"; shift; ;;
    *)      _es=1; ;;
  esac
  # Print Error
  if test "$#" -gt 0; then
    perror "$@" "($_es)";
  else
    perror "Encounter Error ($_es)";
  fi
  exit "$_es";
}


# ---------------------------------------------------------------------------- #

while test "$#" -gt 0; do
  ARGI=$(( ARGI + 1 ));
  case "$1" in
    @+([^@/])/+([^@/]))
      IDENT="$1";
      SCOPE="${IDENT%/*}";
      SCOPE="${SCOPE#@}";
      BNAME="${IDENT#@*/}";
      KIND="Scoped Ident";
    ;;

    [a-z]+([^@/]))
      IDENT="$1";
      BNAME="$IDENT";
      KIND="Unscoped Ident";
    ;;

    @+([^@/])/+([^@/])[@/]+([^@/]))
      IDENT="${1%[@/]*}";
      SCOPE="${IDENT%/*}";
      SCOPE="${SCOPE#@}";
      BNAME="${IDENT#@*/}";
      VERSION="${1##*[@/]}";
      KIND="Scoped Locator";
    ;;

    [a-z]+([^@/])[@/]+([^@/]))
      IDENT="${1%[@/]*}";
      BNAME="$IDENT";
      VERSION="${1##*[@/]}";
      KIND="Unscoped Locator";
    ;;

    *)
      if test "$ARGI" -gt 1; then
        KIND+=", Unknown ($ARGI)";
      else
        KIND="Unknown";
      fi
      break;
    ;;
  esac

  # If we have more args try using as a version.
  if test "$#" -gt 1 && test -z "${VERSION:-}"; then
    case "$2" in
      [0-9]+([^@/]))
        VERSION="$2";
        KIND+=", Version";
        shift;
      ;;
      *) :; ;;
    esac
  fi

  shift;
done


# ---------------------------------------------------------------------------- #

if test -n "${VERBOSE:-}"; then
  $CAT <<EOF >&2
ORIG:    $ORIG
KIND:    $KIND
ARGC:    $ARGI
IDENT:   $IDENT
SCOPE:   $SCOPE
BNAME:   $BNAME
VERSION: $VERSION

EOF
fi


# ---------------------------------------------------------------------------- #

if test -z "$VERSION"; then
  die 2 "You must provide a version number to lookup by key";
fi

KEY="$IDENT/$VERSION";


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
