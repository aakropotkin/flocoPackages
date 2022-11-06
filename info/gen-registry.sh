#! /usr/bin/env bash

: "${NIX:=nix}";
: "${JQ:=jq}";
: "${BASH:=bash}";
: "${FIND:=find}";

# Backup any existing registry.
if test -r ./info.json; then
  echo "Backing up existing ./info.json to ./info.json~" >&2;
  cp ./info.json ./info.json~;
fi

# Some common entries that we may expect to reference in related flakes.
$NIX registry add --registry ./info.json nixpkgs github:NixOS/nixpkgs;
$NIX registry add --registry ./info.json        \
  at-node-nix github:aameen-tulip/at-node-nix;
$NIX registry add --registry ./info.json           \
  flocoPackages github:aakropotkin/flocoPackages;

# Add all sub-flakes to `./info.json' registry.
# Match `id' used by `<flocoPackages>/registry/' treeLocks.
#
# We id using "P--(<SCOPE>--)?<BNAME>", "P" being for "packument".
#
# A top level registry flake will aggregate these with user friendly `ref'
# aliases, here we are just interested in creating fully unique ids.
$FIND . -name flake.lock -exec $JQ -r '
( "{}"|sub( "\\./"; "info/" )|sub( "/flake\\.lock"; "" ) ) as $dir|
.nodes.packument.original.url as $url|$url|
  sub( "https://registry.npmjs.org/"; "" )
  |sub( "@"; "" )
  |sub( "/"; "--" )
  |sub( "\\."; "_"; "g" )
  |"nix registry add --registry ./info.json P--\(.) " +
   "\"github:aakropotkin/flocoPackages?dir=\($dir)\""
' {} \;|$BASH -v;
