{

  inputs.packument.url   = "https://registry.npmjs.org/concat-stream?rev=192-341d45dd82984857fed371251ac1bcfc";
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
    ident = "concat-stream";
    ldir  = "info/unscoped/c/concat-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
