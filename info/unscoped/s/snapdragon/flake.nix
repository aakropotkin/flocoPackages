{

  inputs.packument.url   = "https://registry.npmjs.org/snapdragon?rev=45-014507301cd4e90e1cc0337827bb20b8";
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
    ident = "snapdragon";
    ldir  = "info/unscoped/s/snapdragon";
    inherit packument fetchInfo;
  } // latest';

}
