{

  inputs.packument.url   = "https://registry.npmjs.org/decimal.js?rev=85-c164dd375b3814541aa7ab8f1e2e644a";
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
    ident = "decimal.js";
    ldir  = "info/unscoped/d/decimal.js";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
