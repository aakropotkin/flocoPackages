{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-regenerator?rev=89-eb43eeb0d38e81d7993bc854192cfb2c";
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
    ident = "@babel/plugin-transform-regenerator";
    ldir  = "info/babel/plugin-transform-regenerator";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
