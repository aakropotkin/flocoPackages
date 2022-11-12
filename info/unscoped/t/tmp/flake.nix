{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tmp?_rev=115-ea243d5151939ef5167949fa46554161";
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
    ident = "tmp";
    ldir  = "info/unscoped/t/tmp";
    inherit packument fetchInfo;
  } // latest';

}
