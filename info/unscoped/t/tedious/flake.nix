{

  inputs.packument.url   = "https://registry.npmjs.org/tedious?rev=389-f2150cbba00a9e30c33157cad828eae0";
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
    ident = "tedious";
    ldir  = "info/unscoped/t/tedious";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
