{

  inputs.packument.url   = "https://registry.npmjs.org/promise-breaker?rev=32-a66075b4366fa8238b67225dfa2f31fd";
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
    ident = "promise-breaker";
    ldir  = "info/unscoped/p/promise-breaker";
    inherit packument fetchInfo;
  } // latest';

}
