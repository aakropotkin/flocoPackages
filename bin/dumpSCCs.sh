#! /usr/bin/env bash

: "${NIX:=nix}";
: "${REALPATH:=realpath}";
: "${CAT:=cat}";

: "${SCCMAP:=$NIX shell nixpkgs#graphviz -c sccmap}";
: "${GVPR:=$NIX shell nixpkgs#graphviz -c gvpr}";
: "${GRAPH_EASY:=$NIX run nixpkgs#graph-easy --}";
: "${DOT:=$NIX shell nixpkgs#graphviz -c dot}";


SPATH="$( $REALPATH "${BASH_SOURCE[0]}"; )";
SDIR="${SPATH%/*}";
FLAKE_REF="$SDIR/..";

if [[ "$#" -gt 0 ]]; then
  case "$1" in
    --ascii) POST="$GRAPH_EASY"; ;;
    --json)  POST="$DOT -Tdot_json"; ;;
    *) echo "Unrecognized arg: $*" >&2; exit 1; ;;
  esac
  shift;
fi

: "${POST:=$CAT}";

$NIX eval --raw "$FLAKE_REF#info.pdefsList" --apply 'lst: let
  dpairs = {
    depInfo ? {}
  , key     ? ident + "/" + version
  , ident
  , version
  , ...
  }: let
    needs = builtins.attrValues ( builtins.mapAttrs ( n: { pin, ... }:
      n + "/" + pin
    ) depInfo );
  in map ( t: "  \"" + t + "\" -> \"" + key + "\";" ) needs;
  pairs = builtins.concatMap dpairs lst;
in "digraph flocoPackages {\n" +
   ( builtins.concatStringsSep "\n" pairs ) +
   "\n}"
'|$SCCMAP|$GVPR '
BEG_G
{
  graph_t g = graph( $G.name, "S" );
}

E
{
  node_t h = clone( g, $.head );
  node_t t = clone( g, $.tail );
  edge_t e = edge( t, h, "" );
}

END_G
{
  if ( $G.name != "scc_map" )
    {
      $O = g;
    }
  else
    {
      $O = NULL;
    }
}'|$POST;
