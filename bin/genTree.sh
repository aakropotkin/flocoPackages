#! /usr/bin/env bash
set -euo pipefail;

: "${REALPATH:=realpath}";
: "${NIX:=nix}";
: "${JQ:=jq}";

export METASET="$( $REALPATH "${1:-$PWD/meta.nix}"; )";
: "${FLAKE_REF:=github:aakropotkin/flocoPackages}";

$NIX eval --impure "$FLAKE_REF#flocoPackagesFor" --apply 'fp: let
  mfile   = builtins.getEnv "METASET";
  ms      = assert ( builtins.pathExists mfile ); import mfile;
  lib     = ( builtins.getFlake "at-node-nix" ).lib;
  common  = builtins.intersectAttrs fp.${builtins.currentSystem} ms;
  missing = removeAttrs ms ( ( builtins.attrNames common ) ++ [
    "__meta" ms.__meta.rootKey
  ] );
  rename = k: let
    m = lib.yank "node_modules/(.*)" k;
  in if m == null then null else "$node_modules_path/${k}";
  tree   = lib.remapKeysWith rename ms.__meta.trees.prod;
  msg = let
    names = builtins.attrNames missing;
  in "misssing defs for: " + ( builtins.concatStringsSep " " names );
in if missing != {} then throw msg else tree
' --json --refresh|$JQ;
