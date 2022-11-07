{

  inputs.packument.url   = "https://registry.npmjs.org/@formatjs/intl-unified-numberformat?rev=45-f1d652bcd56c835ca70ea2020b8594fa";
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
    ident = "@formatjs/intl-unified-numberformat";
    ldir  = "info/formatjs/intl-unified-numberformat";
    inherit packument fetchInfo;
  } // latest';

}
