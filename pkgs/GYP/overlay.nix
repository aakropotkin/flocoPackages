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

  nmDirCmdFromTree = { keyTree, flocoPackages }: let
    addMod = to: from: "pjsAddMod ${flocoPackages.${from}} ${to};";
    lines  = builtins.attrValues ( builtins.mapAttrs addMod keyTree );
  in "\n" + ( builtins.concatStringsSep "\n" lines ) + "\n";


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
      key = "${ident}/${version}";
      hasInstallScript = true;
      gypfile          = true;
    };
    meta = base // fromFiles;
  in assert ( meta ? gypfile ) && ( meta ? hasInstallScript );
     meta;


# ---------------------------------------------------------------------------- #

  srcFor = ident: version: let
    inherit (final.lib.parseNodeNames ident) scope bname sdir;
    fetchInfos =
      prev.lib.importJSON ( ../../info + "/${sdir}/${bname}/fetchInfo.json" );
    ec = builtins.addErrorContext "Loading fetchInfo for ${ident}/${version}";
    meta = metaFor ident version;
  in final.flocoBinsFetcher ( meta // {
    fetchInfo = ec fetchInfos.${version};
  } );


# ---------------------------------------------------------------------------- #

  ## This basically just exists to make `lib.canPassStrict' work.
  #defaultBuilder = {
  #  ident
  #, version
  #, src      ? srcFor ident version
  #, keyTree  ? keyTreeFor ident version
  #, nmDirCmd ? if keyTree == {} then ":" else nmDirCmdFromTree {
  #    inherit keyTree;
  #    inherit (final) flocoPackages;
  #  }
  #, nodejs      ? prev.nodejs-14_x
  #, node-gyp    ? nodejs.pkgs.build-gyp
  #, python      ? nodejs.python
  #, xcbuild     ? prev.xcbuild
  #, buildInputs ? []
  #}: final.mkInstPackage {
  #  inherit ident version src nmDirCmd nodejs node-gyp python xcbuild;
  #  inherit buildInputs;
  #  meta = src.meta // ( metaFor ident version );
  #};


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

  __internalGyp = { inherit markedFetchInfos; };

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
          "${ident}/${version}" = let
            keyTree = keyTreeFor ident version;
          in {
            source    = srcFor ident version;
            installed = final.buildGyp {
              name = "${baseNameOf ident}-inst-${version}";
              src  = fpFinal."${ident}/${version}".source;
              inherit ident version;
              meta = metaFor ident version;
              nmDirCmd = if keyTree == {} then ":" else nmDirCmdFromTree {
                inherit keyTree;
                inherit (final) flocoPackages;
              };
            };
            prepared = final.flocoPackages."${ident}/${version}".installed;
            inherit (final.flocoPackages."${ident}/${version}".prepared)
              outPath
            ;
          };
        } ) {} ( builtins.attrNames fis );
      in accS // addV // extra;
      addsB = builtins.foldl' procS {}
                              ( builtins.attrNames markedFetchInfos.${scope} );
    in acc // addsB;
    exported = builtins.foldl' proc {} ( builtins.attrNames markedFetchInfos );
  in ( exported // {
    # Add any explicit defs here.
  } ) );


# ---------------------------------------------------------------------------- #

}  # End Overlay


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
