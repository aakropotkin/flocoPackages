# ============================================================================ #
#
# Overlays Nixpkgs.
#
# ---------------------------------------------------------------------------- #

final: prev: let

# ---------------------------------------------------------------------------- #

  marked = prev.lib.importJSON ./npmjs.json;  # "hier" structure

  # Packages explicitly needed as exports.
  # This list is generated from depgraphs of `BINS/', `INST/', and `GYP/'.
  exports = prev.lib.importJSON ./exports.json;  # list of keys

# ---------------------------------------------------------------------------- #

  srcFor = ident: version: let
    inherit (final.lib.parseNodeNames ident) scope bname sdir;
    fetchInfos =
      prev.lib.importJSON ( ../../info + "/${sdir}/${bname}/fetchInfo.json" );
    ec = builtins.addErrorContext "Loading fetchInfo for ${ident}/${version}";
  in final.flocoSimpleFetcher {
    fetchInfo = ec fetchInfos.${version};
  };


# ---------------------------------------------------------------------------- #

  markedFetchInfos = let
    # FIXME: this can merge with the `foldl'' below.
    forScope = scope: builtins.foldl' ( acc: bname: let
      sl   = prev.lib.toLower ( builtins.substring 0 1 bname );
      sdir = if scope == "unscoped" then "unscoped/${sl}" else scope;
    in acc // {
      ${bname} =
        prev.lib.importJSON ( ../../info + "/${sdir}/${bname}/fetchInfo.json" );
    } ) {};
    sbs = let
      idents = map dirOf exports;
      sbs    = builtins.foldl' ( acc: i: let
        # FIXME: wasteful regex
        scope' = prev.lib.yank "@([^@/]+).*" i;
        scope  = if scope' == null then "unscoped" else scope';
      in acc // {
        ${scope} = ( acc.${scope} or [] ) ++ [( baseNameOf i )] ;
      } ) {} idents;
    in sbs;
  in builtins.mapAttrs forScope sbs;


# ---------------------------------------------------------------------------- #

in {

  __internalSimple = { inherit markedFetchInfos; };

# ---------------------------------------------------------------------------- #

  # Produces store paths from `./locked.json' tree entries.
  # In the case of `type = "file"' entries we produce a derivation of the
  # unpacked tarball; for `type = "tarball"' entries we just produce storepaths.
  flocoSimpleFetcher = { fetchInfo, ... } @ ent: let
    fetched = ( builtins.fetchTree fetchInfo ) // {
      _type   = "fetched";
      ffamily = "file";
      passthru.unpacked = fetchInfo.type == "tarball";
    };
    unpacked = final.flocoUnpack {
      name        = "source";
      tarball     = fetched;
      setBinPerms = false;   # None of these have bins.
    };
    source = if fetchInfo.type == "file" then unpacked else fetched;
  in final.mkPkgEntSource' {
    flocoFetch = builtins.fetchTree;
    inherit (final) flocoUnpack;
  } { metaEnt = ent; inherit source fetched; };


# ---------------------------------------------------------------------------- #

  flocoPackages = prev.flocoPackages.extend ( fpFinal: fpPrev: let
    proc = acc: scope: let
      procS = accS: bname: let
        ident   = if scope == "unscoped" then bname else "@${scope}/${bname}";
        fis     = markedFetchInfos.${scope}.${bname};
        latestV = let
          allVers  = map baseNameOf ( builtins.attrNames fis );
          releases = builtins.filter final.lib.librange.isRelease allVers;
          versions = if releases == [] then allVers else releases;
          latest   = final.lib.latestVersion versions;
          msg      = "${ident} has no versions in its 'fetchInfo' file";
        in if ( builtins.length allVers ) < 1 then throw msg else latest;
        extra = { "${ident}/latest" = fpFinal."${ident}/${latestV}"; };
        addV  = builtins.foldl' ( acc: version: let
          meta = {  # FIXME: `metaFor'
            inherit ident version;
            key              = "${ident}/${version}";
            hasBin           = false;
            hasInstallScript = false;
          };
        in acc // {
          "${ident}/${version}" = final.flocoSimpleFetcher ( meta // {
            fetchInfo = fis.${version};
          } );
        } ) {} ( builtins.attrNames fis );
      in accS // addV // extra;
      # FIXME: limit to the versions listed in `exports'.
      addsB = builtins.foldl' procS {}
                              ( builtins.attrNames markedFetchInfos.${scope} );
    in acc // addsB;
    # FIXME: rename `exported' -> "marked"
    exported = builtins.foldl' proc {} ( builtins.attrNames markedFetchInfos );
    exported' = prev.lib.filterAttrs ( k: _: builtins.elem k exports ) exported;
  in ( exported' // {
    # Add any explicit defs here.
  } ) );


# ---------------------------------------------------------------------------- #

}  # End Overlay


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
