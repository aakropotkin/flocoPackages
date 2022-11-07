{

  inputs.packument.url   = "https://registry.npmjs.org/@antv/adjust?rev=82-6b583db03c9b455d3d2bf2f67b19b49e";
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
    ident = "@antv/adjust";
    ldir  = "info/antv/adjust";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
