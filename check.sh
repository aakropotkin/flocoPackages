#! /usr/bin/env bash
set -eu;

: "${NIX:=nix}";
: "${NIX_FLAGS:=-L --show-trace}";
: "${SYSTEM:=$( $NIX eval --raw --impure --expr builtins.currentSystem; )}";

trap '_es="$?"; exit "$_es";' HUP TERM EXIT INT QUIT;

$NIX flake check $NIX_FLAGS --system "$SYSTEM";
$NIX flake check $NIX_FLAGS --impure --system "$SYSTEM";
