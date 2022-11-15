# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

{ lib, system, stdenv }: let

# ---------------------------------------------------------------------------- #

  full = lib.importJSON ./tree.json;
  #systems = [
  #  "android-64"     "android-arm64"
  #  "darwin-64"      "darwin-arm64"
  #  "freebsd-64"     "freebsd-arm64"
  #  "linux-32"       "linux-64"
  #  "linux-arm"      "linux-arm64"
  #  "linux-mips64le" "linux-ppc64le" "linux-riscv64" "linux-s390x"
  #  "netbsd-64"      "openbsd-64"    "sunos-64"
  #  "windows-32"     "windows-64"    "windows-arm64"
  #];

  npmSys = lib.libsys.getNpmSys { inherit system; };
  # String "x" and "ia" prefixes from "x64" and "ia32"
  cpu    = builtins.replaceStrings ["x" "ia"] ["" ""] npmSys.cpu;
  prefix = "${npmSys.os}-${cpu}";

  ident = "esbuild-${prefix}";

  tree = let
    keeps = ["@esbuild/linux-loong64"];
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

