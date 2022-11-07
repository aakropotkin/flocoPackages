{

  inputs.packument.url   = "https://registry.npmjs.org/esbuild-android-arm64?rev=144-b85277669be3b6ca5c017de6be5eb5f2";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "esbuild-android-arm64";
    ldir  = "info/unscoped/e/esbuild-android-arm64";
    inherit packument fetchInfo;
  } // latest';

}
