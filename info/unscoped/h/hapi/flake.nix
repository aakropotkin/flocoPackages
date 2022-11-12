{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/hapi?_rev=1053-6e0b38161b3221c57c473e044b3a3e88";
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
    ident = "hapi";
    ldir  = "info/unscoped/h/hapi";
    inherit packument fetchInfo;
  } // latest';

}
