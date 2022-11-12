{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-syntax-private-property-in-object?_rev=3-92e0c6d11c41a8d7afc7c5f89c8fb27d";
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
    ident = "@babel/plugin-syntax-private-property-in-object";
    ldir  = "info/babel/plugin-syntax-private-property-in-object";
    inherit packument fetchInfo;
  } // latest';

}
