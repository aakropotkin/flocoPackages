{

  inputs.packument.url   = "https://registry.npmjs.org/docker-modem?rev=97-fcba5a82b506005d26840e6c099e2d22";
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
    ident = "docker-modem";
    ldir  = "info/unscoped/d/docker-modem";
    inherit packument fetchInfo;
  } // latest';

}
