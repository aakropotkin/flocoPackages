{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-transform-typeof-symbol?_rev=82-23741f0ea5a4edc3951b9208c19cf0d3";
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
    ident = "@babel/plugin-transform-typeof-symbol";
    ldir  = "info/babel/plugin-transform-typeof-symbol";
    inherit packument fetchInfo;
  } // latest';

}
