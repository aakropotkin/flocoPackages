{

  inputs.packument.url   = "https://registry.npmjs.org/@pm2/js-api?rev=63-61b065a83e6571a70ca0ac96e4b3a597";
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
    scope = "@pm2";
    ident = "@pm2/js-api";
    ldir  = "info/pm2/js-api";
    inherit packument fetchInfo;
  } // latest';

}
