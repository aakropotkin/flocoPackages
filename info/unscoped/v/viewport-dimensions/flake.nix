{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/viewport-dimensions?_rev=4-72662eef6a7b9ef26ab8ba9ae81c495a";
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
    ident = "viewport-dimensions";
    ldir  = "info/unscoped/v/viewport-dimensions";
    inherit packument fetchInfo;
  } // latest';

}
