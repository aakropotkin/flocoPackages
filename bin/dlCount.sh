#! /usr/bin/env bash
set -eu;

: "${NIX:=nix}";
: "${JQ:=jq}";
: "${REALPATH:=realpath}";

: "${SPATH:=$( $REALPATH "${BASH_SOURCE[0]}"; )}";
: "${FLAKE_REF:=${SPATH%/*}/..}";
$NIX eval --impure --json                        \
          -f "$FLAKE_REF/lib/downloadCount.nix"  \
          --apply "f: f \"${1?}\""               \
  |$JQ;
