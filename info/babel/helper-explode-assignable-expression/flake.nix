{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/helper-explode-assignable-expression?_rev=92-b23b23771f2672f9c89d6d0cb6efd053";
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
    ident = "@babel/helper-explode-assignable-expression";
    ldir  = "info/babel/helper-explode-assignable-expression";
    inherit packument fetchInfo;
  } // latest';

}
