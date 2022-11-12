{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/helper-validator-option?_rev=9-3e7402874a25cec0e2d88449e67aefb4";
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
    ident = "@babel/helper-validator-option";
    ldir  = "info/babel/helper-validator-option";
    inherit packument fetchInfo;
  } // latest';

}
