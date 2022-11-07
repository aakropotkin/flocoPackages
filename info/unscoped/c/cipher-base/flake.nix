{

  inputs.packument.url   = "https://registry.npmjs.org/cipher-base?rev=8-96d88461ae2bc07cbbe18ff2226a3dbc";
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
    ident = "cipher-base";
    ldir  = "info/unscoped/c/cipher-base";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
