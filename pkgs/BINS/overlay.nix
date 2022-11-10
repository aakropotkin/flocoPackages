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

  loadFetchInfo' = {
    scope
  , bname
  , shard ? prev.lib.toLower ( builtins.substring 0 1 bname )
  }: let
    infoDir = ../../info;
    ident = if ( scope == null ) || ( scope == "unscoped" ) then bname else
            "@${scope}/${bname}";
    ldir = if ( scope == null ) || ( scope == "unscoped" )
           then "${infoDir}/unscoped/${shard}/${bname}"
           else "${infoDir}/${scope}/${bname}";
    byVers  = prev.lib.importJSON "${ldir}/fetchInfo.json";
    proc    = acc: v: acc // { "${ident}/${v}" = byVers.${v}; };
  in builtins.foldl' proc {} ( builtins.attrNames byVers );

  loadFetchInfo = ident: let
    infoDir = ../../info;
    m       = builtins.match "(@?([^@/]+)/)?(([^@/])([^@/]+))" ident;
  in loadFetchInfo' {
    scope   = builtins.elemAt m 1;
    bname   = builtins.elemAt m 2;
    shard   = prev.lib.toLower ( builtins.elemAt m 3 );
  };

  markedFetchInfos = let
    asSb = scope: ents:
      builtins.mapAttrs ( bname: _: loadFetchInfo' { inherit scope bname; } )
                        ents;
  in builtins.mapAttrs asSb marked;


# ---------------------------------------------------------------------------- #

  nmDirCmdFromTree = { keysTree, flocoPackages }: let
    addMod = to: from: "pjsAddMod ${flocoPackages.${from}} ${to};";
    lines  = builtins.attrValues ( builtins.mapAttrs addMod keysTree );
  in "\n" + ( builtins.concatStringsSep "\n" lines ) + "\n";


# ---------------------------------------------------------------------------- #

  mkNodePackage = {
    ident
  , version
  , src     ? null
  , keyTree ? null  # fallback is set below
  , ...
  } @ args: let
    dir = "${toString ./.}/${ident}/${version}";
    hasExplicitBuild = builtins.pathExists "${dir}/default.nix";
    builder = if hasExplicitBuild then "${dir}/default.nix" else
              final.mkBinPackage;
    # TODO: the tree handling has a lot of room for improvement.
    hasExplicitTree = builtins.pathExists "${dir}/tree.nix";
    keyTree = args.keyTree or (
      if hasExplicitTree then prev.lib.importJSON "${dir}/tree.nix" else {}
    );
  in prev.lib.callPackageWith {
    inherit (prev)
      pjsUtil
      stdenv
      lib
      evalScripts
      mkBinPackage
    ;
    inherit (final) flocoPackages;
    nodejs = prev.nodejs-14_x;  # FIXME
    globalNmDirCmd = if keyTree == {} then ":" else nmDirCmdFromTree {
      inherit keyTree;
      inherit (final) flocoPackages;
    };
  } builder {
    inherit ident version;
    src = let # FIXME: add `latest'
      fetchInfos = loadFetchInfo ident;
    in final.flocoBinsFetcher { fetchInfo = fetchInfos."${ident}/${version}"; };
  };


# ---------------------------------------------------------------------------- #

in {

# ---------------------------------------------------------------------------- #

  # For debugging:
  #__internal = {
  #  inherit
  #    exports
  #    marked
  #    markedFetchInfos
  #    loadFetchInfo'
  #    loadFetchInfo
  #  ;
  #};

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
      getLatest = ident: versions: let
        scope = let
          m = builtins.match "@([^@/]+)/.*" ident;
        in if m == null then "unscoped" else builtins.head m;
        bname = baseNameOf ident;
        latestV = latestRelease exports.${scope}.${bname};
      in final.flocoPackages."${ident}/${latestV}".global;
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
