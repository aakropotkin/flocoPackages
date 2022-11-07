{

  inputs.packument.url   = "https://registry.npmjs.org/thenify-all?rev=24-8b2c1cd5fb92f7fed262d664b47419ca";
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
    ident = "thenify-all";
    ldir  = "info/unscoped/t/thenify-all";
    inherit packument fetchInfo;
  } // latest';

}
