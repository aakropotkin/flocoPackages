{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-transform-async-to-generator?_rev=87-ffa22b4be598bea8358a1a105f72f12b";
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
    ident = "@babel/plugin-transform-async-to-generator";
    ldir  = "info/babel/plugin-transform-async-to-generator";
    inherit packument fetchInfo;
  } // latest';

}
