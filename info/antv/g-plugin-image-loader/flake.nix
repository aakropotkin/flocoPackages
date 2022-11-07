{

  inputs.packument.url   = "https://registry.npmjs.org/@antv/g-plugin-image-loader?rev=49-d5ec23b879a3023b626b3c0d7cd93ccc";
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
    scope = "@antv";
    ident = "@antv/g-plugin-image-loader";
    ldir  = "info/antv/g-plugin-image-loader";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
