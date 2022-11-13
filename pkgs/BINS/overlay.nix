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

  mkNodePackage = {
    ident
  , version
  , src     ? null
  , keyTree ? null  # fallback is set below
  , ...
  } @ args: let
    bname = baseNameOf ident;
    shard = prev.lib.toLower ( builtins.substring 0 1 bname );
    scope =
      if ( dirOf ident ) != "."
      then builtins.replaceStrings ["@"] [""] ( dirOf ident )
      else "unscoped";
    dir = if scope == "unscoped"
          then "${toString ./.}/unscoped/${shard}/${bname}/${version}"
          else "${toString ./.}/${scope}/${bname}/${version}";
    hasExplicitBuild = builtins.pathExists "${dir}/default.nix";
    builder = if hasExplicitBuild then import "${dir}/default.nix" else
              final.mkBinPackage;
    forTreeNix = let
      f = import ( dir + "/tree.nix" );
      forFn = final.lib.apply f { inherit (final) lib stdenv system; };
    in if prev.lib.isFunction f then forFn else f;
    # TODO: the tree handling has a lot of room for improvement.
    keyTree = args.keyTree or (
      if builtins.pathExists ( dir + "/tree.nix" )
      then builtins.trace "${ident} using tree.nix" forTreeNix
      else if builtins.pathExists "${dir}/tree.json"
           then builtins.trace "${ident} using tree.json"
                                      ( prev.lib.importJSON "${dir}/tree.json" )
           else builtins.trace "${ident} no tree info" {}
    );
    buildEnv = {
      inherit (prev)
        pjsUtil
        evalScripts
        mkBinPackage
      ;
      inherit (final)
        flocoPackages
        lib
        stdenv
      ;
      nodejs = prev.nodejs-14_x;  # FIXME
      globalNmDirCmd = if keyTree == {} then ":" else nmDirCmdFromTree {
        inherit keyTree;
        inherit (final) flocoPackages;
      };
      inherit ident version;
      src = let # FIXME: add `latest'
        fetchInfos = loadFetchInfo ident;
      in final.flocoBinsFetcher {
        fetchInfo = fetchInfos."${ident}/${version}";
      };
    };
    args =
      if hasExplicitBuild then final.lib.canPassStrict builder buildEnv else
      removeAttrs buildEnv [
        "flocoPackages"
        "mkBinPackage"
        "evalScripts"
        "pjsUtil"
        "lib"
      ];
  in builtins.trace ''
    Generating BIN package: ${ident}@${version}
      ident:   ${ident}
      version: ${version}
      bname:   ${bname}
      scope:   ${scope}
      shard:   ${shard}
      dir:     ${dir}
      hasExplicitBuild: ${if hasExplicitBuild then "true" else "false"}
      hasExplicitTree:  ${if keyTree != {} then "true" else "false"}
      keyTree: ${prev.lib.generators.toPretty {} keyTree}
  ''
    builder args;


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
  };


# ---------------------------------------------------------------------------- #

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
