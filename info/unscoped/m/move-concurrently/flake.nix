{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/move-concurrently?_rev=30-2b81f8ab013f2a49c2953685d66a77a6";
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
    ident = "move-concurrently";
    ldir  = "info/unscoped/m/move-concurrently";
    inherit packument fetchInfo;
  } // latest';

}
