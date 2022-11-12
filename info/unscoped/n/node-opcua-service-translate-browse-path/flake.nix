{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-service-translate-browse-path?_rev=180-d2b3a271efc621c13c198eb269b2cb54";
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
    ident = "node-opcua-service-translate-browse-path";
    ldir  = "info/unscoped/n/node-opcua-service-translate-browse-path";
    inherit packument fetchInfo;
  } // latest';

}
