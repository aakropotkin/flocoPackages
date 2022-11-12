{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ansi-fragments?_rev=4-bde8e0cc3c75b5cd1c8d94079f7b41e1";
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
    ident = "ansi-fragments";
    ldir  = "info/unscoped/a/ansi-fragments";
    inherit packument fetchInfo;
  } // latest';

}
