{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/which?_rev=78-9298bc6e59f1e4b5249d5b1c1b6ce6fa";
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
    ident = "which";
    ldir  = "info/unscoped/w/which";
    inherit packument fetchInfo;
  } // latest';

}
