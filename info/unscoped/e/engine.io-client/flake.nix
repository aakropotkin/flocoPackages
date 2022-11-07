{

  inputs.packument.url   = "https://registry.npmjs.org/engine.io-client?rev=265-e317d2488684200b8408325a4d19694b";
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
    ident = "engine.io-client";
    ldir  = "info/unscoped/e/engine.io-client";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
