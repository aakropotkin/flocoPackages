{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/i18next?_rev=564-8755ae3368b440fa3a479b6ab5cfb999";
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
    ident = "i18next";
    ldir  = "info/unscoped/i/i18next";
    inherit packument fetchInfo;
  } // latest';

}
