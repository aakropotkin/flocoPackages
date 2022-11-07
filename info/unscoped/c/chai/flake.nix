{

  inputs.packument.url   = "https://registry.npmjs.org/chai?rev=522-d6fd8b62b2795ac5be7780db0c6111eb";
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
    ident = "chai";
    ldir  = "info/unscoped/c/chai";
    inherit packument fetchInfo;
  } // latest';

}
