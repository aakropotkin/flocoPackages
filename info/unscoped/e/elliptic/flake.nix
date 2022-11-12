{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/elliptic?_rev=155-cd152c2192239a1ebacf798c330672ad";
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
    ident = "elliptic";
    ldir  = "info/unscoped/e/elliptic";
    inherit packument fetchInfo;
  } // latest';

}
