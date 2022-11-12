{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fhelper-builder-binary-assignment-operator-visitor?_rev=89-cb7df02388f5393e1d2329784f8ef5f9";
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
    ident = "@babel/helper-builder-binary-assignment-operator-visitor";
    ldir  = "info/babel/helper-builder-binary-assignment-operator-visitor";
    inherit packument fetchInfo;
  } // latest';

}
