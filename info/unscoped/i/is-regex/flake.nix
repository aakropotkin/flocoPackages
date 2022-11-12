{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-regex?_rev=25-f16b1c65a3b2c6a75f8e924a24d72229";
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
    ident = "is-regex";
    ldir  = "info/unscoped/i/is-regex";
    inherit packument fetchInfo;
  } // latest';

}
