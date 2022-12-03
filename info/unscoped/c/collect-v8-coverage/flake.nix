{

  inputs.packument.url   = "https://registry.npmjs.org/collect-v8-coverage";
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
    ident = "collect-v8-coverage";
    ldir  = "info/unscoped/c/collect-v8-coverage";
    inherit packument fetchInfo;
  } // latest';

}
