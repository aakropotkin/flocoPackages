{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/side-channel?_rev=6-a7e8517a88e7bc99f59fc5c34264c944";
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
    ident = "side-channel";
    ldir  = "info/unscoped/s/side-channel";
    inherit packument fetchInfo;
  } // latest';

}
