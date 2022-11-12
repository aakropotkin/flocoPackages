{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/compat-data?_rev=51-c993850e2b2bd8167aabcc4d709fa575";
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
    scope = "@babel";
    ident = "@babel/compat-data";
    ldir  = "info/babel/compat-data";
    inherit packument fetchInfo;
  } // latest';

}
