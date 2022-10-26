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
    inherit (prev) pjsUtil stdenv lib;
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
    } ) );
  #flocoApps = let
  #  proc = acc: k: acc // { ${baseNameOf ( dirOf k )} = ents.${k}.global; };
  #in builtins.foldl' proc {} ( builtins.attrNames ents );

  flocoApps = {
    acorn = final.flocoPackages."acorn/8.8.0".global;
  };

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
