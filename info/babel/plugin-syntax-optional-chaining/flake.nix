{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-syntax-optional-chaining?rev=69-fd96e6918aec101f7a6c754ecad87cd1";
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
    ident = "@babel/plugin-syntax-optional-chaining";
    ldir  = "info/babel/plugin-syntax-optional-chaining";
    inherit packument fetchInfo;
  } // latest';

}
