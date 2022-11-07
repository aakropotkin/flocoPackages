#! /usr/bin/env bash
set -eu;

: "${FIND:=find}";
: "${DIRNAME:=dirname}";

for d in $( $FIND . -name flake.nix -exec $DIRNAME {} \+; ); do
  case "$d" in
    ./unscoped/*) echo "${d##*/}"; ;;
    *)            echo "@${d#\./}"; ;;
  esac
done
