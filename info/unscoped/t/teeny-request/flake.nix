{

  inputs.packument.url   = "https://registry.npmjs.org/teeny-request?rev=60-d460c223d3dbb0d69683eccdb40f59cf";
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
    ident = "teeny-request";
    ldir  = "info/unscoped/t/teeny-request";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
