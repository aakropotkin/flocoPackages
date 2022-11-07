{

  inputs.packument.url   = "https://registry.npmjs.org/concat-with-sourcemaps?rev=33-1a6f7689df1f7dd45ffe38cef1572318";
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
    ident = "concat-with-sourcemaps";
    ldir  = "info/unscoped/c/concat-with-sourcemaps";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
