{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-dir?_rev=65-8f84758f337f7211067cd74be4661b33";
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
    ident = "node-dir";
    ldir  = "info/unscoped/n/node-dir";
    inherit packument fetchInfo;
  } // latest';

}
