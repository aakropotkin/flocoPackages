{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/get-func-name?_rev=5-9f6e0ab6bcd7810e50d6032d165fb59b";
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
    ident = "get-func-name";
    ldir  = "info/unscoped/g/get-func-name";
    inherit packument fetchInfo;
  } // latest';

}
