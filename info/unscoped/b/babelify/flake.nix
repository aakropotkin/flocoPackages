{

  inputs.packument.url   = "https://registry.npmjs.org/babelify?rev=126-5827b7bee7822e6eef2fcba7f71d3697";
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
    ident = "babelify";
    ldir  = "info/unscoped/b/babelify";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
