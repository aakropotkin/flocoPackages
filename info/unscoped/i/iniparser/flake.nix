{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/iniparser?_rev=20-7876761f2798afd0e953fc1801ab1c1d";
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
    ident = "iniparser";
    ldir  = "info/unscoped/i/iniparser";
    inherit packument fetchInfo;
  } // latest';

}
