{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining";
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
    ident = "@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining";
    ldir  = "info/babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining";
    inherit packument fetchInfo;
  } // latest';

}
