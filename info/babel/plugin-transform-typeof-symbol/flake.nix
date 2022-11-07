{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-typeof-symbol?rev=82-23741f0ea5a4edc3951b9208c19cf0d3";
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
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
