{

  inputs.packument.url   = "https://registry.npmjs.org/mkdirp-infer-owner?rev=4-eadc02905bdb6605c5ec181ee97b45cb";
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
    ident = "mkdirp-infer-owner";
    ldir  = "info/unscoped/m/mkdirp-infer-owner";
    inherit packument fetchInfo;
  } // latest';

}
