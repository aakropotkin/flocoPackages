{

  inputs.packument.url   = "https://registry.npmjs.org/@antv/g2?rev=382-fa8c7293f11e213003e0183f21db8f1a";
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
    ident = "@antv/g2";
    ldir  = "info/antv/g2";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
