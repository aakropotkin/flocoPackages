{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/abort-controller?_rev=13-204b5741abc4fc7c9dddab0f172ce6d7";
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
    ident = "abort-controller";
    ldir  = "info/unscoped/a/abort-controller";
    inherit packument fetchInfo;
  } // latest';

}
