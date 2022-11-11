# ============================================================================ #
#
# Overlays Nixpkgs.
#
# ---------------------------------------------------------------------------- #

final: prev: let

# ---------------------------------------------------------------------------- #

  # A miniature `lib' for using treelock registries.
  rlib = import ../../registry/lib.nix;

  # Packages explicitly marked for export.
  marked = prev.lib.importJSON ./npmjs.json;

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

in {

  # Produces store paths from `./locked.json' tree entries.
  # In the case of `type = "file"' entries we produce a derivation of the
  # unpacked tarball; for `type = "tarball"' entries we just produce storepaths.
  flocoSimpleFetcher = { fetchInfo, ... } @ ent: let
    fetched  = builtins.fetchTree fetchInfo;
    unpacked = final.flocoUnpack {
      name        = "source";
      tarball     = fetched;
      setBinPerms = false;   # None of these have bins.
    };
    src = if fetchInfo.type == "file" then unpacked else fetched;
  in ent // src;

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

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
