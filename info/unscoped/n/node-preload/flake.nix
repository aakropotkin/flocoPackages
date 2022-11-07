{

  inputs.packument.url   = "https://registry.npmjs.org/node-preload?rev=7-39791ccd0ab249806e62e75359380670";
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
    ident = "node-preload";
    ldir  = "info/unscoped/n/node-preload";
    inherit packument fetchInfo;
  } // latest';

}
