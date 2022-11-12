{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@formatjs/intl-utils?_rev=66-e7560588f42edf8fce00c193ea7cd29b";
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
    scope = "@formatjs";
    ident = "@formatjs/intl-utils";
    ldir  = "info/formatjs/intl-utils";
    inherit packument fetchInfo;
  } // latest';

}
