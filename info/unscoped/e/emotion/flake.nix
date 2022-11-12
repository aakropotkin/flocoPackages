{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/emotion?_rev=171-0306cb720c9f294daf67388e95cd91a4";
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
    ident = "emotion";
    ldir  = "info/unscoped/e/emotion";
    inherit packument fetchInfo;
  } // latest';

}
