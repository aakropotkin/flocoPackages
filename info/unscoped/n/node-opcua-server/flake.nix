{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-server?_rev=245-602707c63adb80117089aa57f8549989";
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
    ident = "node-opcua-server";
    ldir  = "info/unscoped/n/node-opcua-server";
    inherit packument fetchInfo;
  } // latest';

}
