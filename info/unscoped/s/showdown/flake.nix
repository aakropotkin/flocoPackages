{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/showdown?_rev=117-7648da37226d4a39db696693f42525b1";
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
    ident = "showdown";
    ldir  = "info/unscoped/s/showdown";
    inherit packument fetchInfo;
  } // latest';

}
