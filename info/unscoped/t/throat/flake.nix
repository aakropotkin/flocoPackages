{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/throat?_rev=40-dd672b669bb3c271a8c8fd8884c5c565";
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
    ident = "throat";
    ldir  = "info/unscoped/t/throat";
    inherit packument fetchInfo;
  } // latest';

}
