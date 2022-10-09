#! /usr/bin/env bash
: "${NIX:=nix}";
$NIX eval --impure --json -f ./closure-for.nix --apply "addClosure:
  addClosure { ident = \"${1?Enter a package identifier}\"; }
" > npmjs.json~ && mv ./npmjs.json~ ./npmjs.json;
