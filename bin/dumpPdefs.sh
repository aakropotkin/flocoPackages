#! /usr/bin/env bash

: "${REALPATH:=realpath}";
SPATH="$( $REALPATH "${BASH_SOURCE[0]}"; )";
SDIR="${SPATH%/*}";
: "${FLAKE_REF=$SDIR/..}";
export FLAKE_REF;

nix eval --impure --expr 'let
  floco = builtins.getFlake ( builtins.getEnv "FLAKE_REF" );
  mod   = floco.lib.evalModules {
    modules = [floco.nixosModules.default];
  };
  ex = builtins.mapAttrs ( ident: (
         builtins.mapAttrs ( version: v: v._export ) )
       ) mod.config.floco.pdefs;
in { floco.pdefs = ex; }
' "$@";
