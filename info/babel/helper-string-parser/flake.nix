{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/helper-string-parser?_rev=1-7e25109e70b759bb176136c6fb8619f8";
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
    ident = "@babel/helper-string-parser";
    ldir  = "info/babel/helper-string-parser";
    inherit packument fetchInfo;
  } // latest';

}
