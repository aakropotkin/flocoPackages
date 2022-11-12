{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/helper-optimise-call-expression?_rev=89-e88c9e3d4057c7c91ef3ff84c64deba9";
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
    ident = "@babel/helper-optimise-call-expression";
    ldir  = "info/babel/helper-optimise-call-expression";
    inherit packument fetchInfo;
  } // latest';

}
