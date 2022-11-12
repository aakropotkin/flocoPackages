{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/gtoken?_rev=73-04f4048c04af7294e9644bfe17ca0dc7";
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
    ident = "gtoken";
    ldir  = "info/unscoped/g/gtoken";
    inherit packument fetchInfo;
  } // latest';

}
