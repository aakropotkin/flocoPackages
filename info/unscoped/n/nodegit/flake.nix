{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/nodegit?_rev=267-db1a24a42eb29f72d48f80e82907ce93";
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
    ident = "nodegit";
    ldir  = "info/unscoped/n/nodegit";
    inherit packument fetchInfo;
  } // latest';

}
