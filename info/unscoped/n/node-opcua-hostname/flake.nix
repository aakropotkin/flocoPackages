{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-hostname?_rev=71-7c39b1c380128c8a37f0ae2588c4c2cc";
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
    ident = "node-opcua-hostname";
    ldir  = "info/unscoped/n/node-opcua-hostname";
    inherit packument fetchInfo;
  } // latest';

}
