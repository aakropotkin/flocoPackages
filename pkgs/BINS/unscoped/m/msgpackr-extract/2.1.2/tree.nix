# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

{ lib, system, stdenv }: let

# ---------------------------------------------------------------------------- #

  full = lib.importJSON ./tree.json;

  npmSys = lib.libsys.getNpmSys { inherit system; };
  # String "x" and "ia" prefixes from "x64" and "ia32"
  prefix = "${npmSys.os}-${npmSys.cpu}";

  ident = "msgpackr-extract-${prefix}";

  tree = let
    keeps = ["node-gyp-build-optional-packages"];
    cond  = path: key:
      ( builtins.elem ( dirOf key ) keeps ) ||
      ( lib.hasSuffix ident path );
  in lib.filterAttrs cond full;


# ---------------------------------------------------------------------------- #

in assert tree != {};
   tree

# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #

