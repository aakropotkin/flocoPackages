{

  inputs.packument.url   = "https://registry.npmjs.org/metalsmith?rev=145-9c04b2c060d45237fa8945153cc6c204";
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
    scope = null;
    ident = "metalsmith";
    ldir  = "info/unscoped/m/metalsmith";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
