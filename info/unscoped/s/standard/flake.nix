{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/standard?_rev=507-a59de00a8219a57d4dd17e9d1e9de6a4";
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
    ident = "standard";
    ldir  = "info/unscoped/s/standard";
    inherit packument fetchInfo;
  } // latest';

}
