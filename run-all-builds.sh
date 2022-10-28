#! /usr/bin/env bash
set -eu;

: "${NIX:=nix}";
: "${NIX_FLAGS:=-L --show-trace --no-link}";
: "${SYSTEM:=$( $NIX eval --raw --impure --expr builtins.currentSystem; )}";
: "${JQ:=jq}";

trap '_es="$?"; exit "$_es";' HUP TERM EXIT INT QUIT;

targets=( $( $NIX flake show --json|$JQ ".packages[\"$SYSTEM\"]|keys[]"; ) );

for t in "${targets[@]}"; do
  echo "Building Impure:  $t";
  $NIX build $NIX_FLAGS --impure ".#$t";
  echo "Building Pure:  $t";
  $NIX build $NIX_FLAGS ".#$t";
done
