{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/intl-messageformat?_rev=276-2f04d1914df8c1b19cf8572d35fecf03";
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
    ident = "intl-messageformat";
    ldir  = "info/unscoped/i/intl-messageformat";
    inherit packument fetchInfo;
  } // latest';

}
