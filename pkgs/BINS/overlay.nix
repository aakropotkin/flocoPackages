# ============================================================================ #
#
# Overlays Nixpkgs.
#
# ---------------------------------------------------------------------------- #

final: prev: let

  # A miniature `lib' for using treelock registries.
  rlib = import ../../registry/lib.nix;

  lockedEnts = builtins.foldl' ( acc: ent: acc // {
    ${ent.ident} = final.flocoPackages."${ent.ident}/${ent.version}";
    "${ent.ident}/${ent.version}" = final.flocoBinsFetcher ent;
  } ) {} ( prev.lib.importJSON ./locked.json );

  # FIXME: regEnts;

  #ents = prev.lib.recursiveUpdate regEnts lockedEnts;
  sources = lockedEnts;

  mkNodePackage = {
    ident
  , version
  , src      ? sources."${ident}/${version}"
  , ...
  }: prev.lib.callPackageWith {
    inherit (prev)
      pjsUtil
      stdenv
      lib
      installGlobalNodeModuleHook
      patchNodePackageHook
      evalScripts
    ;
    inherit (final) flocoPackages;
    nodejs = prev.nodejs-14_x;  # FIXME
  } "${toString ./.}/${ident}/${version}/default.nix" {
    inherit src ident version;
    # FIXME: `mkNmDir' prod
  };

  #ents = let
  #  builderDefined = { ident, version, ... }:
  #    builtins.pathExists "${toString ./.}/${ident}/${version}/default.nix";
  #  keeps = prev.lib.filterAttrs ( _: builderDefined ) sources;
  #in builtins.mapAttrs mkNodePackage keeps;

in {

  # Produces store paths from `./locked.json' tree entries.
  # In the case of `type = "file"' entries we produce a derivation of the
  # unpacked tarball; for `type = "tarball"' entries we just produce storepaths.
  flocoBinsFetcher = { sourceInfo, ... } @ ent: let
    fetched  = builtins.fetchTree sourceInfo;
    fetchUnpacked = {
      sourceInfo = sourceInfo // fetched;
      inherit (fetched) outPath;
      meta.hasBin = true;
      passthru.binPermsSet = false;
    };
    unpacked = let
      u = final.flocoUnpack {
        name        = "source";
        tarball     = fetched;
        setBinPerms = true;
        meta.hasBin = true;
      };
    in u // { passthru = u.passtrhu // { binPermsSet = true; }; };
    src = if ent.sourceInfo.type == "file" then unpacked else fetchUnpacked;
  in ent // src;

  flocoPackages =
    prev.flocoPackages.extend ( fpFinal: fpPrev: ( {
      "acorn/8.8.0" = mkNodePackage { ident = "acorn"; version = "8.8.0"; };
      "which/2.0.2" = mkNodePackage { ident = "which"; version = "2.0.2"; };
      "typescript/4.8.3" = mkNodePackage {
        ident = "typescript";
        version = "4.8.3";
      };
      "js-yaml/4.1.0" = mkNodePackage { ident = "js-yaml"; version = "4.1.0"; };
      "rimraf/3.0.2"  = mkNodePackage { ident = "rimraf"; version = "3.0.2"; };
      "json5/1.0.1"   = mkNodePackage { ident = "json5"; version = "1.0.1"; };
      "loose-envify/1.4.0" = mkNodePackage {
        ident = "loose-envify";
        version = "1.4.0";
      };
      "semver/6.3.0"   = mkNodePackage { ident = "semver"; version = "6.3.0"; };
      "semver/7.3.7"   = mkNodePackage { ident = "semver"; version = "7.3.7"; };
      "eslint/8.26.0" = mkNodePackage { ident = "eslint"; version = "8.26.0"; };
      "eslint-config-prettier/8.5.0" = mkNodePackage {
        ident = "eslint-config-prettier";
        version = "8.5.0";
      };
    } ) );
  #flocoApps = let
  #  proc = acc: k: acc // { ${baseNameOf ( dirOf k )} = ents.${k}.global; };
  #in builtins.foldl' proc {} ( builtins.attrNames ents );

  flocoApps = {
    acorn        = final.flocoPackages."acorn/8.8.0".global;
    which        = final.flocoPackages."which/2.0.2".global;
    typescript   = final.flocoPackages."typescript/4.8.3".global;
    js-yaml      = final.flocoPackages."js-yaml/4.1.0".global;
    rimraf       = final.flocoPackages."rimraf/3.0.2".global;
    json5        = final.flocoPackages."json5/1.0.1".global;
    loose-envify = final.flocoPackages."loose-envify/1.4.0".global;
    # Use newer version
    semver = final.flocoPackages."semver/7.3.7".global;
    eslint = final.flocoPackages."eslint/8.26.0".global;
    eslint-config-prettier =
      final.flocoPackages."eslint-config-prettier/8.5.0".global;
  };

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
