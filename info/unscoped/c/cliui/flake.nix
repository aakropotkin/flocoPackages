{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cliui?_rev=44-6b93b4b743eba7c7b4187df02dac07a7";
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
    ident = "cliui";
    ldir  = "info/unscoped/c/cliui";
    inherit packument fetchInfo;
  } // latest';

}
