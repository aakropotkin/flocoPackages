{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/streamx?_rev=41-32a9b12cd084d5eb7d08ddb0263b5d77";
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
    ident = "streamx";
    ldir  = "info/unscoped/s/streamx";
    inherit packument fetchInfo;
  } // latest';

}
