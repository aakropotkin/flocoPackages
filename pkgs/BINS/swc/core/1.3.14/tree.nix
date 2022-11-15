# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

{ lib, system, stdenv }: let

# ---------------------------------------------------------------------------- #

  full = lib.importJSON ./tree.json;
  systems = [
    "darwin-arm64"
    "darwin-x64"
    "linux-arm-gnueabihf"
    "linux-arm64-gnu"
    "linux-arm64-musl"
    "linux-x64-gnu"
    "linux-x64-musl"
    "win32-arm64-msvc"
    "win32-ia32-msvc"
    "win32-x64-msvc"
  ];

  npmSys = lib.libsys.getNpmSys { inherit system; };
  prefix = "${npmSys.os}-${npmSys.cpu}";

  suffix = let
    forLinux = if stdenv.hostPlatform.isMusl then "-musl" else "-gnu";
  in if stdenv.hostPlatform.isDarwin then "" else
     if stdenv.hostPlatform.isLinux  then forLinux else
     throw "@swc/core: Unsupported system: ${system}";

  ident = "@swc/core-${prefix}${suffix}";

  tree = lib.filterAttrs ( path: key: ( lib.hasSuffix ident path ) ) full;


# ---------------------------------------------------------------------------- #

in assert tree != {};
   tree

# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
