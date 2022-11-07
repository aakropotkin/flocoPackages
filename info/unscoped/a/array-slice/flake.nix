{

  inputs.packument.url   = "https://registry.npmjs.org/array-slice?rev=19-3c9f4b6571f6e9522c1029e206afa8b2";
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
    ident = "array-slice";
    ldir  = "info/unscoped/a/array-slice";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
