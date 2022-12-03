{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-syntax-private-property-in-object";
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
