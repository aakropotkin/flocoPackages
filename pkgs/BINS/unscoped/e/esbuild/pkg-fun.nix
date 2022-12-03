{ lib
, stdenv
, evalScripts
, runCommandNoCC
, pjsUtil
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
        key = fetched.ident + "/" + fetched.version;
        inherit (fetched) ident version ltype outPath;
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
          metaEnt = metaEnt.__serial // {
            inherit (fetched) fetchInfo;
          };
          inherit (metaEnt) names;
        };
      } )
  ];

  sysPkg = mkPkg { ident = sysPkgName; fetchInfo = sysFetchInfo; };
  pkg    = let
    prev = mkPkg { ident = "esbuild"; inherit fetchInfo; };
  in prev // {
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
        chmod +w "$node_modules_path/$esbuildSysPkgName"       \
                 "$node_modules_path/$esbuildSysPkgName/bin";
        chmod +x "$node_modules_path/$esbuildSysPkgName/bin/esbuild";
      '';
      runScripts      = ["postinstall"];
      dontRemoveNmDir = true;
      # FIXME: meta.supportedSystems
      passthru.pkgSet.${sysPkg.key} = sysPkg;
      # Asserts that we can run `esbuild --version;' when installing the module.
      # This is harder than the `global' install case because we're bundling
      # the native deps but we haven't reported that in any metadata.
      passthru.test.runVersion = let
        name = pkg.passthru.names.genName "test-version";
      in runCommandNoCC name {
        nativeBuildInputs = [pjsUtil];
        esbuildModule = pkg.outPath;
      } ''
        set -euv;
        export node_modules_path="$PWD/node_modules";
        pjsAddModCopy "$esbuildModule" "$node_modules_path/esbuild";
        installBinsNm "$node_modules_path/esbuild" "$node_modules_path";
        export PATH="$PATH:$node_modules_path/.bin";
        esbuild --version|tee "$out";
      '';
      inherit (pkg.passthru) metaEnt;
    };
    inherit (pkg.installed) global outPath;
    passthru = prev.passthru // {
      inherit (pkg.installed.passthru) test;
    };
  };

in pkg
