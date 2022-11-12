{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/get-value?_rev=63-e1a09d7b579b5fa468aa06edcfdafcfb";
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
    ident = "get-value";
    ldir  = "info/unscoped/g/get-value";
    inherit packument fetchInfo;
  } // latest';

}
