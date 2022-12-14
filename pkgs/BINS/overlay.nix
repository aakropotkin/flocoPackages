# ============================================================================ #
#
# Overlays Nixpkgs.
#
# ---------------------------------------------------------------------------- #

final: prev: let

# ---------------------------------------------------------------------------- #

  # Essentially this means that we have audited the generated builders.
  exports = prev.lib.importJSON ./exports.json;

# ---------------------------------------------------------------------------- #

  nmDirCmdFromTree = { keyTree, flocoPackages }: let
    addMod = to: from: "pjsAddMod ${flocoPackages.${from}} ${to};";
    lines  = builtins.attrValues ( builtins.mapAttrs addMod keyTree );
  in "\n" + ( builtins.concatStringsSep "\n" lines ) + "\n";


# ---------------------------------------------------------------------------- #

  nmDirCmdFromMeta = { flocoPackages, ident, version }: let
    lookupMeta = { ident, version }: /* TODO */ {};
  in /* TODO */ {};


# ---------------------------------------------------------------------------- #

  keyTreeFor = ident: version: let
    inherit (final.lib.parseNodeNames ident) scope bname sdir;
    treeNixPath  = ./. + "/${sdir}/${bname}/${version}/tree.nix";
    treeJSONPath = ./. + "/${sdir}/${bname}/${version}/tree.json";
    forTreeNix = let
      f     = import treeNixPath;
      forFn = final.lib.apply f { inherit (final) lib stdenv system; };
    in if prev.lib.isFunction f then forFn else f;
    forJSON = prev.lib.importJSON treeJSONPath;
  in if builtins.pathExists treeNixPath
     then builtins.traceVerbose "${ident} using tree.nix" forTreeNix
     else if builtins.pathExists treeJSONPath
     then builtins.traceVerbose "${ident} using tree.json" forJSON
     else builtins.traceVerbose "${ident} no tree info" {};


# ---------------------------------------------------------------------------- #

  metaFor = ident: version: let
    inherit (final.lib.parseNodeNames ident) scope bname sdir;
    metaNixPathV  = ./. + "/${sdir}/${bname}/${version}/meta.nix";
    metaJSONPathV = ./. + "/${sdir}/${bname}/${version}/meta.json";
    metaNixPathP  = ./. + "/${sdir}/${bname}/meta.nix";
    metaJSONPathP = ./. + "/${sdir}/${bname}/meta.json";
    metaNixPath   =
      if builtins.pathExists metaNixPathV  then metaNixPathV else
      if builtins.pathExists metaNixPathP  then metaNixPathP else
      null;
    metaJSONPath = 
      if builtins.pathExists metaJSONPathV then metaJSONPathV else
      if builtins.pathExists metaJSONPathP then metaJSONPathP else
      null;
    forMetaNix = let
      f     = import metaNixPath;
      forFn = final.lib.apply f {
        inherit version;
        inherit (final) lib stdenv system;
      };
    in if prev.lib.isFunction f then forFn else f;
    forMetaJSON = prev.lib.importJSON metaJSONPath;
    fromFiles =
      if metaNixPath != null then forMetaNix else
      if metaJSONPath != null then forMetaJSON else {};
    base = {
      inherit ident version;
      key   = "${ident}/${version}";
      ltype = "file";
    };
    meta = base // fromFiles;
  in assert meta ? binInfo;
     meta;


# ---------------------------------------------------------------------------- #

  srcFor = ident: version: let
    inherit (final.lib.parseNodeNames ident) scope bname sdir;
    fetchInfos =
      prev.lib.importJSON ( ../../info + "/${sdir}/${bname}/fetchInfo.json" );
    ec   = builtins.addErrorContext "Loading fetchInfo for ${ident}/${version}";
    meta = metaFor ident version;
  in final.flocoBinsFetcher ( meta // {
    fetchInfo = ec fetchInfos.${version};
  } );


# ---------------------------------------------------------------------------- #

  # This basically just exists to make `lib.canPassStrict' work.
  defaultBuilder = {
    ident
  , version
  , src            ? srcFor ident version
  , keyTree        ? keyTreeFor ident version
  , globalNmDirCmd ? if keyTree == {} then ":" else nmDirCmdFromTree {
      inherit keyTree;
      inherit (final) flocoPackages;
    }
  , nodejs ? prev.nodejs-14_x
  }: let
    metaEnt = ( metaFor ident version ) // {
      inherit (src.source) fetchInfo;
    };
  in final.mkBinPackage {
    inherit ident version src globalNmDirCmd nodejs;
    passthru = ( src.passthru or {} ) // { inherit metaEnt; };
    inherit metaEnt;
  };


# ---------------------------------------------------------------------------- #

  mkNodePackage = {
    ident
  , version
  , src     ? srcFor ident version
  , keyTree ? keyTreeFor ident version
  , ...
  } @ args: let
    inherit (final.lib.parseNodeNames ident) scope bname sdir;
    defaultNixPath   = ./. + "/${sdir}/${bname}/${version}/default.nix";
    hasExplicitBuild = builtins.pathExists defaultNixPath;
    builder =
      if hasExplicitBuild then import defaultNixPath else defaultBuilder;
    buildEnv = {
      inherit ident version src keyTree;
      inherit (prev) pjsUtil evalScripts mkBinPackage;
      inherit (final) flocoPackages lib stdenv;
      globalNmDirCmd = if keyTree == {} then ":" else nmDirCmdFromTree {
        inherit keyTree;
        inherit (final) flocoPackages;
      };
      nodejs = prev.nodejs-14_x;  # FIXME
      inherit (src) passthru;
      metaEnt = src.meta // ( metaFor ident version );
    };
    args = final.lib.canPassStrict builder buildEnv;
    msg = ''
      Generating BIN package: ${ident}@${version}
        ident:   ${ident}
        version: ${version}
        scope:   ${if scope == null then "null" else scope}
        bname:   ${bname}
        sdir:    ${sdir}
        hasExplicitBuild: ${if hasExplicitBuild then "true" else "false"}
        hasExplicitTree:  ${if keyTree != {} then "true" else "false"}
        keyTree: ${prev.lib.generators.toPretty {} keyTree}
    '';
    built  = builder args;
    checks = ent: let
      bin = ent.binInfo or ent.metaEnt.binInfo or null;
    in {
      hasOutPath  = ent ? outPath;
      hasGlobal   = ent ? global;
      setBinAttrs = ( builtins.isAttrs bin ) && ( bin != {} );
    };
    checked = let
      loc = "flocoPackages#overlays.bins";
      pp  = prev.lib.generators.toPretty { allowPrettyValues = true; } built;
      msg = "(${loc}): ent/meta for ${ident}@${version} is invalid.\n${pp}";
      tests   = checks built;
      details = let
        proc = acc: tf: if tests.${tf} then acc else acc + "\nFAIL: ${tf}";
      in builtins.foldl' proc msg ( builtins.attrNames tests );
      pass = builtins.all ( b: b ) ( builtins.attrValues tests );
    in if pass then built else throw details;
  in builtins.traceVerbose msg checked;


# ---------------------------------------------------------------------------- #

in {

# ---------------------------------------------------------------------------- #

  # Produces store paths from fetchTreeEntries.
  # In the case of `type = "file"' entries we produce a derivation of the
  # unpacked tarball; for `type = "tarball"' entries we just produce storepaths.
  flocoBinsFetcher = { fetchInfo, ... } @ ent: let
    fetched = ( builtins.fetchTree fetchInfo ) // {
      _type   = "fetched";
      ffamily = "file";
      passthru.unpacked = fetchInfo.type == "tarball";
    };
    fetchUnpacked = {
      fetchInfo = fetchInfo // fetched;
      inherit (fetched) outPath;
      passthru.binPermsSet = false;
    };
    unpacked = let
      u = final.flocoUnpack {
        name        = "source";
        tarball     = fetched;
        setBinPerms = true;
      };
    in u // { passthru = u.passthru // { binPermsSet = true; }; };
    source = if ( ent.type or ent.fetchInfo.type ) == "file" then unpacked else
             fetchUnpacked;
  in final.mkPkgEntSource' {
    flocoFetch = builtins.fetchTree;
    inherit (final) flocoUnpack;
  } { metaEnt = ent; inherit source fetched; };


# ---------------------------------------------------------------------------- #

  flocoPackages = prev.flocoPackages.extend ( fpFinal: fpPrev: let
    procP = ident: versions: version: versions // {
      "${ident}/${version}" = mkNodePackage { inherit ident version; };
    };
    proc = acc: scope: let
      procS = accS: bname: let
        ident   = if scope == "unscoped" then bname else "@${scope}/${bname}";
        latestV = final.lib.librange.latestRelease exports.${scope}.${bname};
        addsV   = builtins.foldl' ( procP ident ) {} exports.${scope}.${bname};
        extra = { "${ident}/latest" = fpFinal."${ident}/${latestV}"; };
      in accS // ( addsV // extra );
      addsB = builtins.foldl' procS {} ( builtins.attrNames exports.${scope} );
    in acc // addsB;
    exported = builtins.foldl' proc {} ( builtins.attrNames exports );
  in ( exported // {
    # Add any explicit defs here.

    "esbuild/0.14.54" = import ./unscoped/e/esbuild/pkg-fun.nix {
      inherit (final) lib stdenv evalScripts runCommandNoCC pjsUtil;
      version = "0.14.54";
    };

    "update-browserslist-db/1.0.10" = let
      pkgPrev = exported."update-browserslist-db/1.0.10";
    in pkgPrev // { inherit (pkgPrev.src) outPath; };

    "jest-cli/27.5.1" = let
      pkgPrev = exported."jest-cli/27.5.1";
    in pkgPrev // { inherit (pkgPrev.src) outPath; };

    "jest-cli/28.1.3" = let
      pkgPrev = exported."jest-cli/28.1.3";
    in pkgPrev // { inherit (pkgPrev.src) outPath; };

    "jest-cli/29.3.0" = let
      pkgPrev = exported."jest-cli/29.3.0";
    in pkgPrev // { inherit (pkgPrev.src) outPath; };

    "jest-cli/29.3.1" = let
      pkgPrev = exported."jest-cli/29.3.1";
    in pkgPrev // { inherit (pkgPrev.src) outPath; };

  } ) );


# ---------------------------------------------------------------------------- #

  #flocoApps = let
  #  proc = acc: k: acc // { ${baseNameOf ( dirOf k )} = ents.${k}.global; };
  #in builtins.foldl' proc {} ( builtins.attrNames ents );

  flocoApps = let
    exported = let
      inherit (final.lib.librange) latestRelease;
      getLatests = acc: scope: let
        proc = accS: bname: let
          ident = if scope == "unscoped" then bname else "@${scope}/${bname}";
          latestV = latestRelease exports.${scope}.${bname};
          appName = if scope == "unscoped" then bname else "${scope}--${bname}";
        in accS // {
          ${appName} = final.flocoPackages."${ident}/${latestV}".global;
        };
        adds = builtins.foldl' proc {} ( builtins.attrNames exports.${scope} );
      in acc // adds;
    in builtins.foldl' getLatests {} ( builtins.attrNames exports );
  in exported // {
    # Add explicit defs

    "css-blank-pseudo--0_1_4" =
      final.flocoPackages."css-blank-pseudo/0.1.4".global;

    # FIXME: These have a peer cycle
    # "update-browserslist-db/1.0.10" = final.flocoPackages."browserslist/4.21.4";

  };


# ---------------------------------------------------------------------------- #

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
