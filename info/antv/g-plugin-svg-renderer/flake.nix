{

  inputs.packument.url   = "https://registry.npmjs.org/@antv/g-plugin-svg-renderer?rev=156-887cefd90ffc416e4cddcc90f275bd0a";
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
    ident = "@antv/g-plugin-svg-renderer";
    ldir  = "info/antv/g-plugin-svg-renderer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
