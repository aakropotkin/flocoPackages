{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@75lb%2fdeep-merge?_rev=3-4ee97a1176787d5b95d5a71bad44292a";
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
    scope = "@75lb";
    ident = "@75lb/deep-merge";
    ldir  = "info/75lb/deep-merge";
    inherit packument fetchInfo;
  } // latest';

}
