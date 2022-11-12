{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/available-typed-arrays?_rev=6-8054d07cbab1cb4402eacf2b3eacd701";
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
    ident = "available-typed-arrays";
    ldir  = "info/unscoped/a/available-typed-arrays";
    inherit packument fetchInfo;
  } // latest';

}
