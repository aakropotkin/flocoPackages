{

  inputs.packument.url   = "https://registry.npmjs.org/shot?rev=164-ed56142fec9d9e857cb0f1a16deb3e07";
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
    ident = "shot";
    ldir  = "info/unscoped/s/shot";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
