#! /usr/bin/env bash
# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

: "${NIX:=nix}";
: "${REALPATH:=realpath}";
: "${SORT:=sort}";

: "${SCCMAP:=$NIX shell nixpkgs#graphviz -c sccmap}";
: "${GVPR:=$NIX shell nixpkgs#graphviz -c gvpr}";


# ---------------------------------------------------------------------------- #

SPATH="$( $REALPATH "${BASH_SOURCE[0]}"; )";
SDIR="${SPATH%/*}";
FLAKE_REF="$SDIR/..";


# ---------------------------------------------------------------------------- #

export FLAKE_REF;

#shellcheck disable=SC2016
$NIX eval --raw --impure --expr 'let
  fp = builtins.getFlake ( builtins.getEnv "FLAKE_REF" );
  inherit (fp) lib info;
in lib.libfloco.pdefsToDOT { pdefs = info.pdefsList; }
'|$SCCMAP|$GVPR '
BEG_G {}
N
{
  if ( $G.name != "scc_map" )
    {
      print( $.name );
    }
}'|$SORT -u;


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
