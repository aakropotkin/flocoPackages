{

  inputs.packument.url   = "https://registry.npmjs.org/esbuild-android-64?rev=46-2786b88a4e57e97e199a6d707f90af9d";
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
    ident = "esbuild-android-64";
    ldir  = "info/unscoped/e/esbuild-android-64";
    inherit packument fetchInfo;
  } // latest';

}
