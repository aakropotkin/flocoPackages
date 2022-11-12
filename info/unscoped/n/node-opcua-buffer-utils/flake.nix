{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-buffer-utils?_rev=88-c34fba00bad1b58de0c5a846f4aa048b";
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
    ident = "node-opcua-buffer-utils";
    ldir  = "info/unscoped/n/node-opcua-buffer-utils";
    inherit packument fetchInfo;
  } // latest';

}
