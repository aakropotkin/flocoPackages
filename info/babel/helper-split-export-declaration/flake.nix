{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fhelper-split-export-declaration?_rev=56-a23d9ccdb5ff6e59b4e39e1f35283538";
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
    ident = "@babel/helper-split-export-declaration";
    ldir  = "info/babel/helper-split-export-declaration";
    inherit packument fetchInfo;
  } // latest';

}
