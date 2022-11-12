{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/temp?_rev=70-ec2a56c0822145fa5900e9273d31e53b";
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
    ident = "temp";
    ldir  = "info/unscoped/t/temp";
    inherit packument fetchInfo;
  } // latest';

}
