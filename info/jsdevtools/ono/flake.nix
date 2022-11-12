{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jsdevtools%2fono?_rev=9-bd9caa266b0f2cfdd3edf1a1c595ed4a";
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
    scope = "@jsdevtools";
    ident = "@jsdevtools/ono";
    ldir  = "info/jsdevtools/ono";
    inherit packument fetchInfo;
  } // latest';

}
