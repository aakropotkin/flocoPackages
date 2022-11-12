{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/clipboardy?_rev=39-0f95c93e8e8daeace4cc22fabd20152d";
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
    ident = "clipboardy";
    ldir  = "info/unscoped/c/clipboardy";
    inherit packument fetchInfo;
  } // latest';

}
