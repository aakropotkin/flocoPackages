{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/dockerode?_rev=195-5b335b92700c0e8b25cdaa0bb6bd1950";
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
    ident = "dockerode";
    ldir  = "info/unscoped/d/dockerode";
    inherit packument fetchInfo;
  } // latest';

}
