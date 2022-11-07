{

  inputs.packument.url   = "https://registry.npmjs.org/simple-statistics?rev=110-2bb42208517bb2ff26c43668b7406d01";
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
    ident = "simple-statistics";
    ldir  = "info/unscoped/s/simple-statistics";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
