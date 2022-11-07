{

  inputs.packument.url   = "https://registry.npmjs.org/request-promise-native?rev=39-7d147dd3c1419c2399d37c2e3df205e4";
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
    ident = "request-promise-native";
    ldir  = "info/unscoped/r/request-promise-native";
    inherit packument fetchInfo;
  } // latest';

}
