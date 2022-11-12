{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fcode-frame?_rev=91-c8b6435e453d88bce3e041787848fbfe";
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
    ident = "@babel/code-frame";
    ldir  = "info/babel/code-frame";
    inherit packument fetchInfo;
  } // latest';

}
