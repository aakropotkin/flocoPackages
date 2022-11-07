{

  inputs.packument.url   = "https://registry.npmjs.org/p-cancelable?rev=20-ac48f2c7a0fa9e6c8f19707af90bf2b4";
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
    ident = "p-cancelable";
    ldir  = "info/unscoped/p/p-cancelable";
    inherit packument fetchInfo;
  } // latest';

}
