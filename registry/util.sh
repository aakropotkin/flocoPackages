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

countFileEnts() {
  $JQ '.trees|map( select( .to.type == "file" ) )|length' "$1";
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
