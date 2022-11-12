{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/denodeify?_rev=24-e5b4f5270309acba85f0ee5146134a54";
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
    ident = "denodeify";
    ldir  = "info/unscoped/d/denodeify";
    inherit packument fetchInfo;
  } // latest';

}
