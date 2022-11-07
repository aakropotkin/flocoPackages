{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-object-super?rev=80-c7cd60159877b2d5cc13eed9beaabd68";
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
    ident = "@babel/plugin-transform-object-super";
    ldir  = "info/babel/plugin-transform-object-super";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
