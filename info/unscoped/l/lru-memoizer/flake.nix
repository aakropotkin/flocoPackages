{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lru-memoizer?_rev=30-0819ca64962678895473986a6827c2f5";
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
    ident = "lru-memoizer";
    ldir  = "info/unscoped/l/lru-memoizer";
    inherit packument fetchInfo;
  } // latest';

}
