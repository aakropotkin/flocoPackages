{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-transform-classes?_rev=103-91b1e9d06df019b1348bc94f5cc2f158";
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
    ident = "@babel/plugin-transform-classes";
    ldir  = "info/babel/plugin-transform-classes";
    inherit packument fetchInfo;
  } // latest';

}
