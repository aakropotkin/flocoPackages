{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/path-root-regex?_rev=6-82dc2eb027987b112353c2044ac6d7df";
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
    ident = "path-root-regex";
    ldir  = "info/unscoped/p/path-root-regex";
    inherit packument fetchInfo;
  } // latest';

}
