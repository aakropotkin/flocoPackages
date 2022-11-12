{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/line-column?_rev=6-b2515a90fcbfd6dab6f4ff6773328ed1";
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
    ident = "line-column";
    ldir  = "info/unscoped/l/line-column";
    inherit packument fetchInfo;
  } // latest';

}
