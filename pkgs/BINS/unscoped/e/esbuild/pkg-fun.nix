{ lib
, stdenv
, evalScripts
, version
}: let

  sysPkgName = {
    i686-linux     = "esbuild-linux-32";
    x86_64-linux   = "esbuild-linux-64";
    aarch64-linux  = "esbuild-linux-arm64";
    x86_64-darwin  = "esbuild-darwin-64";
    aarch64-darwin = "esbuild-darwin-arm64";
  }.${stdenv.buildPlatform.system};

  fetchInfoFile    = ../../../../../info/unscoped/e/esbuild/fetchInfo.json;
  sysFetchInfoFile = ../../../../../info/unscoped/e +
                     ( "/" + sysPkgName + "/fetchInfo.json" );

  # These are all "safe" tarballs.
  fetchInfo    = ( lib.importJSON fetchInfoFile ).${version};
  sysFetchInfo = ( lib.importJSON sysFetchInfoFile ).${version};

  # An "arrow"/function pipeline
  mkPkg = lib.flip lib.pipe [
    ( { ident, fetchInfo }: let
        sourceInfo = builtins.fetchTree fetchInfo;
      in {
        _type   = "fetched";
        ltype   = "file";
        ffamily = "file";
        inherit ident version fetchInfo sourceInfo;
        inherit (sourceInfo) outPath;
        passthru.unpacked    = true;
        passthru.binPermsSet = false;
      } )
    ( fetched: {
        _type = "pkgEnt:source";
        inherit (fetched) ident version key ltype outPath;
        source   = fetched;
        passthru = let
          pjs = lib.importJSON ( fetched.outPath + "/package.json" );
          metaEnt = lib.libpjs.metaEntFromPjsNoWs' {
            pure = true; ifd = false; typecheck = false; allowedPaths = [];
          } {
            inherit (fetched) ltype;
            pjs     = pjs // { gypfile = false; };
            isLocal = false;
            pjsDir  = fetched.outPath;
          };
        in {
          metaEnt = metaEnt.__serial;
          inherit (metaEnt) names;
        };
      } )
  ];

  sysPkg = mkPkg { ident = sysPkgName; fetchInfo = sysFetchInfo; };
  pkg    = ( mkPkg { ident = "esbuild"; inherit fetchInfo; } ) // {
    _type     = "pkgEnt";
    installed = evalScripts {
      name  = pkg.passthru.names.installed;
      pname = "esbuild";
      inherit (pkg) version;
      src               = pkg.source.outPath;
      globalInstall     = true;
      esbuildSysPkgName = sysPkgName;
      esbuildSysPkg     = sysPkg.outPath;
      nmDirCmd = ''
        mkdir -p "$node_modules_path";
        cp -r --reflink=auto -- "$esbuildSysPkg"                          \
                                "$node_modules_path/$esbuildSysPkgName";
        chmod +x "$node_modules_path/$esbuildSysPkgName/bin/esbuild";
        chmod +w "$node_modules_path/$esbuildSysPkgName"       \
                 "$node_modules_path/$esbuildSysPkgName/bin";
      '';
      runScripts = ["postinstall"];
      dontRemoveNmDir = true;
      # FIXME: meta.supportedSystems
      passthru.pkgSet.${sysPkg.key} = sysPkg;
      inherit (pkg.passthru) metaEnt;
    };
    inherit (pkg.installed) global;
  };

in pkg
