{

  inputs.packument.url   = "https://registry.npmjs.org/eazy-logger?rev=40-2a7ee4a428fb930f76434dccb297fb5b";
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
    ident = "eazy-logger";
    ldir  = "info/unscoped/e/eazy-logger";
    inherit packument fetchInfo;
  } // latest';

}
