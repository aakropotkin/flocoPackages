{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/browser-sync-ui?_rev=118-853a95ef7ca2ae4e054249f382b101ad";
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
    ident = "browser-sync-ui";
    ldir  = "info/unscoped/b/browser-sync-ui";
    inherit packument fetchInfo;
  } // latest';

}
