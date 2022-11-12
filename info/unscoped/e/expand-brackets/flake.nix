{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/expand-brackets?_rev=26-d93eed3e3f590d1597669248978c00a7";
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
    ident = "expand-brackets";
    ldir  = "info/unscoped/e/expand-brackets";
    inherit packument fetchInfo;
  } // latest';

}
