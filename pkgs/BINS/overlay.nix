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
  marked  = prev.lib.importJSON ./npmjs.json;

# ---------------------------------------------------------------------------- #

  infoDir = toString ../../info;

  loadFetchInfo' = {
    scope
  , bname
  , shard ? prev.lib.toLower ( builtins.substring 0 1 bname )
  }: let
    ident = if ( scope == null ) || ( scope == "unscoped" ) then bname else
            "@${scope}/${bname}";
    ldir = if ( scope == null ) || ( scope == "unscoped" )
           then infoDir + "/unscoped/${shard}/${bname}"
           else infoDir + "/${scope}/${bname}";
    byVers  = prev.lib.importJSON ( ldir + "/fetchInfo.json" );
    proc    = acc: v: acc // { "${ident}/${v}" = byVers.${v}; };
  in builtins.foldl' proc {} ( builtins.attrNames byVers );

  loadFetchInfo = ident: let
    m = builtins.match "(@?([^@/]+)/)?(([^@/])([^@/]+))" ident;
  in loadFetchInfo' {
    scope = builtins.elemAt m 1;
    bname = builtins.elemAt m 2;
    shard = prev.lib.toLower ( builtins.elemAt m 3 );
  };

  markedFetchInfos = let
    asSb = scope: ents:
      builtins.mapAttrs ( bname: _: loadFetchInfo' { inherit scope bname; } )
                        ents;
  in builtins.mapAttrs asSb marked;


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
    forJSON   = prev.lib.importJSON treeJSONPath;
  in if builtins.pathExists treeNixPath
     then builtins.trace "${ident} using tree.nix" forTreeNix
     else if builtins.pathExists treeJSONPath
     then builtins.trace "${ident} using tree.json" forJSON
     else builtins.trace "${ident} no tree info" {};


# ---------------------------------------------------------------------------- #

  srcFor = ident: version: let
    inherit (final.lib.parseNodeNames ident) scope bname sdir;
    fetchInfos =
      prev.lib.importJSON ( ../../info + "/${sdir}/${bname}/fetchInfo.json" );
    ec = builtins.addErrorContext "Loading fetchInfo for ${ident}/${version}";
  in final.flocoBinsFetcher {
    fetchInfo = ec fetchInfos.${version};
  };


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
  }: final.mkBinPackage { inherit ident version src globalNmDirCmd nodejs; };



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
    };
    args= final.lib.canPassStrict builder buildEnv;
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
    built = builder args;
  in builtins.trace msg built;


# ---------------------------------------------------------------------------- #

in {

# ---------------------------------------------------------------------------- #

  # For debugging:
  __internalBins = {
    inherit
      exports
      marked
      markedFetchInfos
      loadFetchInfo'
      loadFetchInfo
    ;
  };

# ---------------------------------------------------------------------------- #

  # Produces store paths from fetchTreeEntries.
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
