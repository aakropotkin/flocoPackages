{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-fetch?_rev=338-fd03f52a47512c9f1254856e3243536b";
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
    ident = "node-fetch";
    ldir  = "info/unscoped/n/node-fetch";
    inherit packument fetchInfo;
  } // latest';

}
