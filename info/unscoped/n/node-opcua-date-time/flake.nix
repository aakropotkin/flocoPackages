{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-date-time?_rev=110-544757f6f6f91d6b9cdac2da578e71eb";
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
    ident = "node-opcua-date-time";
    ldir  = "info/unscoped/n/node-opcua-date-time";
    inherit packument fetchInfo;
  } // latest';

}
