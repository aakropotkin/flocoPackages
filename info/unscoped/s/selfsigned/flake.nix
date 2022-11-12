{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/selfsigned?_rev=47-a9cabdd8c38db147b9db8835abfd1af0";
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
    ident = "selfsigned";
    ldir  = "info/unscoped/s/selfsigned";
    inherit packument fetchInfo;
  } // latest';

}
