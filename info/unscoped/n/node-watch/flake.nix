{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-watch?_rev=108-7d5aeb465f5e9d405af076aa2bf77aca";
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
    ident = "node-watch";
    ldir  = "info/unscoped/n/node-watch";
    inherit packument fetchInfo;
  } // latest';

}
