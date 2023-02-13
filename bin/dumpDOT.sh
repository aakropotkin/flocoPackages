#! /usr/bin/env bash
# ============================================================================ #
#
# Examples:
#
# Show connected components. ( Not the same as "strongly connected components" )
#   dumpDOT.sh|ccomps -x -X "redux-devtools-extension/2.13.9"
#
# Show connected component containing node "redux-devtools-extension/2.13.9"
#   dumpDOT.sh|ccomps -x -X "redux-devtools-extension/2.13.9"
#
#
# ---------------------------------------------------------------------------- #

: "${NIX:=nix}";
: "${REALPATH:=realpath}";

#: "${GVPR:=$NIX shell nixpkgs#graphviz -c gvpr}";


# ---------------------------------------------------------------------------- #

SPATH="$( $REALPATH "${BASH_SOURCE[0]}"; )";
SDIR="${SPATH%/*}";
FLAKE_REF="$SDIR/..";


# ---------------------------------------------------------------------------- #

export FLAKE_REF;

$NIX eval --raw --impure --expr 'let
  fp = builtins.getFlake ( builtins.getEnv "FLAKE_REF" );
  inherit (fp) lib info;
in lib.libfloco.pdefsToDOT { pdefs = info.pdefsList; }
';


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
