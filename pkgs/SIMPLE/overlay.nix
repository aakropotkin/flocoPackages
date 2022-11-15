# ============================================================================ #
#
# Overlays Nixpkgs.
#
# ---------------------------------------------------------------------------- #

final: prev: let

# ---------------------------------------------------------------------------- #

  # Packages explicitly marked for export.
  marked = prev.lib.importJSON ./npmjs.json;

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
    forScope = scope: builtins.foldl' ( acc: bname: let
      sl   = prev.lib.toLower ( builtins.substring 0 1 bname );
      sdir = if scope == "unscoped" then "unscoped/${sl}" else scope;
    in acc // {
      ${bname} =
        prev.lib.importJSON ( ../../info + "/${sdir}/${bname}/fetchInfo.json" );
    } ) {};
  in builtins.mapAttrs forScope marked;


# ---------------------------------------------------------------------------- #

in {

  __internalSimple = { inherit markedFetchInfos; };

# ---------------------------------------------------------------------------- #

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
  in ent // { sourceInfo = src; inherit (src) outPath; };


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
        addV  = builtins.foldl' ( acc: version: acc // {
          "${ident}/${version}" = final.flocoSimpleFetcher {
            inherit ident version;
            key              = "${ident}/${version}";
            fetchInfo        = fis.${version};
            hasBin           = false;
            hasInstallScript = false;
          };
        } ) {} ( builtins.attrNames fis );
      in accS // addV // extra;
      addsB = builtins.foldl' procS {}
                              ( builtins.attrNames markedFetchInfos.${scope} );
    in acc // addsB;
    exported = builtins.foldl' proc {} ( builtins.attrNames markedFetchInfos );
  in ( exported // {
    # Add any explicit defs here.

    # FIXME: remove dtrace-provider

  } ) );


# ---------------------------------------------------------------------------- #

}  # End Overlay


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
