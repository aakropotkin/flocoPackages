#! /usr/bin/env bash
# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

: "${NIX:=nix}";
: "${REALPATH:=realpath}";
: "${CAT:=cat}";

: "${SCCMAP:=$NIX shell nixpkgs#graphviz -c sccmap}";
: "${GVPR:=$NIX shell nixpkgs#graphviz -c gvpr}";
: "${GRAPH_EASY:=$NIX run nixpkgs#graph-easy --}";
: "${DOT:=$NIX shell nixpkgs#graphviz -c dot}";


# ---------------------------------------------------------------------------- #

SPATH="$( $REALPATH "${BASH_SOURCE[0]}"; )";
SDIR="${SPATH%/*}";


# ---------------------------------------------------------------------------- #

if [[ "$#" -gt 0 ]]; then
  case "$1" in
    --ascii) POST="$GRAPH_EASY"; ;;
    --json)  POST="$DOT -Tdot_json"; ;;
    *) echo "Unrecognized arg: $*" >&2; exit 1; ;;
  esac
  shift;
fi

: "${POST:=$CAT}";


# ---------------------------------------------------------------------------- #

#shellcheck disable=SC2016
$SDIR/dumpDOT.sh|$SCCMAP|$GVPR 'BEG_G {}
END_G { if ( $G.name != "scc_map" ) { $O = $G; } else { $O = NULL; } }
'|$POST;


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
