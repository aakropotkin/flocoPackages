# ============================================================================ #
#
# Overlays Nixpkgs.
#
# ---------------------------------------------------------------------------- #

final: prev: let

# ---------------------------------------------------------------------------- #

  # Packages explicitly marked for export.
  # Essentially this means that we have audited the generated builders.
  exports = prev.lib.importJSON ./exports.json;

# ---------------------------------------------------------------------------- #

  # A miniature `lib' for using treelock registries.
  rlib = import ../../registry/lib.nix;

  lockedEnts = builtins.foldl' ( acc: ent: acc // {
    ${ent.ident} = final.flocoPackages."${ent.ident}/${ent.version}";
    "${ent.ident}/${ent.version}" = final.flocoBinsFetcher ent;
  } ) {} ( prev.lib.importJSON ./locked.json );

  # FIXME: regEnts;

  #ents = prev.lib.recursiveUpdate regEnts lockedEnts;
  sources = lockedEnts;


# ---------------------------------------------------------------------------- #

  # Generic default bin installer ( does global and module install ).
  mkBinPackage = import ./mkBinPackage.nix;

  mkNodePackage = {
    ident
  , version
  , src      ? sources."${ident}/${version}"
  , ...
  }: let
    dir = "${toString ./.}/${ident}/${version}";
    hasExplicit = builtins.pathExists "${dir}/default.nix";
    builder = if hasExplicit then "${dir}/default.nix" else mkBinPackage;
  in prev.lib.callPackageWith {
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
  } builder {
    inherit src ident version;
    # FIXME: `mkNmDir' prod
  };


# ---------------------------------------------------------------------------- #

  # Sources partitioned based on whether or not they have explicit defs.
  partExplicit = let
    builderDefined = { ident, version, ... }:
      builtins.pathExists "${toString ./.}/${ident}/${version}/default.nix";
    parted = builtins.partition builderDefined ( builtins.attrValues sources );
    rekeyProc = acc: { ident, version, ... } @ ent:
      acc // { "${ident}/${version}" = ent; };
  in {
    explicit = builtins.foldl' rekeyProc {} parted.right;
    default  = builtins.foldl' rekeyProc {} parted.wrong;
  };


# ---------------------------------------------------------------------------- #

in {

  # Produces store paths from `./locked.json' tree entries.
  # In the case of `type = "file"' entries we produce a derivation of the
  # unpacked tarball; for `type = "tarball"' entries we just produce storepaths.
  flocoBinsFetcher = { fetchInfo, ... } @ ent: let
    fetched  = builtins.fetchTree fetchInfo;
    fetchUnpacked = {
      fetchInfo = fetchInfo // fetched;
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
    src = if ( ent.type or ent.fetchInfo.type ) == "file" then unpacked else
          fetchUnpacked;
  in ent // src;


# ---------------------------------------------------------------------------- #

  flocoPackages = prev.flocoPackages.extend ( fpFinal: fpPrev: let
    procP = ident: versions: version: versions // {
      "${ident}/${version}" = mkNodePackage { inherit ident version; };
    };
    proc = acc: ident: let
      latestV = final.lib.librange.latestRelease exports.${ident};
      addsV = builtins.foldl' ( procP ident ) {} exports.${ident};
      extra = { "${ident}/latest" = fpFinal."${ident}/${latestV}"; };
    in acc // ( addsV // extra );
    exported = builtins.foldl' proc {} ( builtins.attrNames exports );
  in ( exported // {
    # Add any explicit defs here.
  } ) );


# ---------------------------------------------------------------------------- #

  #flocoApps = let
  #  proc = acc: k: acc // { ${baseNameOf ( dirOf k )} = ents.${k}.global; };
  #in builtins.foldl' proc {} ( builtins.attrNames ents );

  flocoApps = let
    exported = let
      inherit (final.lib.librange) latestRelease;
      getLatest = ident: versions:
        final.flocoPackages."${ident}/${latestRelease exports.${ident}}".global;
    in builtins.mapAttrs getLatest exports;
  in exported // {
    # Add explicit defs
  };


# ---------------------------------------------------------------------------- #

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
