{

  inputs.packument.url   = "https://registry.npmjs.org/is-generator-fn?rev=7-01c2897fb77e8aa5b5ee2b3e2168ae28";
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
    ident = "is-generator-fn";
    ldir  = "info/unscoped/i/is-generator-fn";
    inherit packument fetchInfo;
  } // latest';

}
