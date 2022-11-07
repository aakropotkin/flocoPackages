{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-syntax-class-properties?rev=73-f3bfb607080ccb07b30ede4e20e3e8d3";
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
    ident = "@babel/plugin-syntax-class-properties";
    ldir  = "info/babel/plugin-syntax-class-properties";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
