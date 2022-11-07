{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-arrow-functions?rev=80-406d516e1654936d336a06e4287e869d";
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
    ident = "@babel/plugin-transform-arrow-functions";
    ldir  = "info/babel/plugin-transform-arrow-functions";
    inherit packument fetchInfo;
  } // latest';

}
