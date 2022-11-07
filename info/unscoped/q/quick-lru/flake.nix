{

  inputs.packument.url   = "https://registry.npmjs.org/quick-lru?rev=16-36a9e7cdfbb4f8f6cb5186ff284994b7";
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
    ident = "quick-lru";
    ldir  = "info/unscoped/q/quick-lru";
    inherit packument fetchInfo;
  } // latest';

}
