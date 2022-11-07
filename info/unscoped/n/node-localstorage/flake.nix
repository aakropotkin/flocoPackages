{

  inputs.packument.url   = "https://registry.npmjs.org/node-localstorage?rev=72-ec97d0f5fb11351120ce03d2c49fce20";
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
    ident = "node-localstorage";
    ldir  = "info/unscoped/n/node-localstorage";
    inherit packument fetchInfo;
  } // latest';

}
