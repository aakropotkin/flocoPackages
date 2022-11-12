{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@formatjs/intl-listformat?_rev=122-8ee439687389126d4b879108dc2fd567";
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
    ident = "@formatjs/intl-listformat";
    ldir  = "info/formatjs/intl-listformat";
    inherit packument fetchInfo;
  } // latest';

}
