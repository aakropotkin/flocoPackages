# ============================================================================ #
#
# Source Me
#
# ---------------------------------------------------------------------------- #

: "${JQ:=jq}";
: "${PACOTE:=pacote}";
: "${REALPATH:=realpath}";
: "${GIT:=git}";

SDIR="${BASH_SOURCE[0]%/*}";
: "${SDIR:=$( $GIT rev-parse --show-toplevel; )/registry}";
SDIR="$( $REALPATH "$SDIR"; )";


# ---------------------------------------------------------------------------- #

# Print the number of `type = "file"' entries in a treeLock.
countFileEnts() {
  $JQ '.trees|map( select( .to.type == "file" ) )|length' "$1";
}

# Predicate for whether there are any file entries ( prints "true"/"false" ).
# `--quiet' sets exit code instead of printing.
hasFileEnts() {
  local TARGET QUIET RESULT;
  while test "$#" -gt 0; do
    case "$1" in
      -q|--quiet) QUIET=:; ;;
      -*) echo "Unrecognized flag: $*" >&2; return 1; ;;
      *) TARGET="$1"; ;;
    esac
    shift;
  done
  if test "$( countFileEnts "$TARGET"; )" -gt 0; then
    test -n "${QUIET:+y}" && return 0;
    RESULT="true";
  else
    test -n "${QUIET:+y}" && return 1;
    RESULT="FALSE";
  fi
  echo "$RESULT";
}


# ---------------------------------------------------------------------------- #

registryVersions() {
  $PACOTE packument --json "$1" 2>/dev/null|$JQ '.versions|keys';
}


# ---------------------------------------------------------------------------- #

lockedVersions() {
  local TARGET O_URI;
  while test "$#" -gt 0; do
    case "$1" in
      -u|--uri) O_URI=:; ;;
      -*) echo "Unrecognized flag: $*" >&2; return 1; ;;
      *) TARGET="$1"; ;;
    esac
    shift;
  done
  if test -n "${O_URI:+y}"; then
    $JQ '
    .trees|map( {
      key: .from.id,
      value: ( .to.id // (
        .to.type + "+" + .to.url + (
          if has( "fetchInfo" ) then "?narHash=\(.fetchInfo.narHash)"
                                else ""
          end
        )
      ) )
    } )|from_entries
    ' "$TARGET";
  else
    $JQ '.trees|map( {
      key: .from.id, value: ( .to + ( .fetchInfo // {} ) )
    } )|from_entries' "$TARGET";
  fi
}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
