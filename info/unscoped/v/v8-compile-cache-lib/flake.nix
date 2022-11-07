{

  inputs.packument.url   = "https://registry.npmjs.org/v8-compile-cache-lib?rev=2-d72e398b06011103df993c5f38b7a82f";
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
    ident = "v8-compile-cache-lib";
    ldir  = "info/unscoped/v/v8-compile-cache-lib";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
