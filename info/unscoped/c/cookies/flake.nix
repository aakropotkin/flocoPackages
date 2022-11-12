{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cookies?_rev=120-0332a54d104131b08b419ebb54f9af3d";
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
    ident = "cookies";
    ldir  = "info/unscoped/c/cookies";
    inherit packument fetchInfo;
  } // latest';

}
