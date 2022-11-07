{

  inputs.packument.url   = "https://registry.npmjs.org/serviceworker-cache-polyfill?rev=4-b6f4a14a62c1adc3e21eda9a021f88a6";
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
    ident = "serviceworker-cache-polyfill";
    ldir  = "info/unscoped/s/serviceworker-cache-polyfill";
    inherit packument fetchInfo;
  } // latest';

}
