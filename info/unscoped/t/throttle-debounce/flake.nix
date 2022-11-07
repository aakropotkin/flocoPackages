{

  inputs.packument.url   = "https://registry.npmjs.org/throttle-debounce?rev=36-671d585a9ce9f6cee4725098a2274c62";
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
    ident = "throttle-debounce";
    ldir  = "info/unscoped/t/throttle-debounce";
    inherit packument fetchInfo;
  } // latest';

}
