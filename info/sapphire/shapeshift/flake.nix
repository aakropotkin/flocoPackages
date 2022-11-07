{

  inputs.packument.url   = "https://registry.npmjs.org/@sapphire/shapeshift?rev=301-97d517145fb466c0bbc07d080c2d815f";
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
    scope = "@sapphire";
    ident = "@sapphire/shapeshift";
    ldir  = "info/sapphire/shapeshift";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
