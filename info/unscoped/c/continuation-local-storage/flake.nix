{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/continuation-local-storage?_rev=121-29129d56ca944bdff0c93ea121b5c61c";
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
    ident = "continuation-local-storage";
    ldir  = "info/unscoped/c/continuation-local-storage";
    inherit packument fetchInfo;
  } // latest';

}
