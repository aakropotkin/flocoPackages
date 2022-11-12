{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/intl-messageformat-parser?_rev=170-29f8b9e6d12170b18dcf55deedaa2e4c";
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
    ident = "intl-messageformat-parser";
    ldir  = "info/unscoped/i/intl-messageformat-parser";
    inherit packument fetchInfo;
  } // latest';

}
