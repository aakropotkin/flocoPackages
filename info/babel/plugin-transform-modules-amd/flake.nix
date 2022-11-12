{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-transform-modules-amd?_rev=91-786e6f7cf8a8127b42c49e9a80d6cd6a";
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
    ident = "@babel/plugin-transform-modules-amd";
    ldir  = "info/babel/plugin-transform-modules-amd";
    inherit packument fetchInfo;
  } // latest';

}
