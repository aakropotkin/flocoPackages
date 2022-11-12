{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/exit?_rev=26-cedd1fc4926877d39d75aa12963c3e93";
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
    ident = "exit";
    ldir  = "info/unscoped/e/exit";
    inherit packument fetchInfo;
  } // latest';

}
