{

  inputs.packument.url   = "https://registry.npmjs.org/serve-index?rev=104-13ef4668859cac0409bd4320b17318c7";
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
    ident = "serve-index";
    ldir  = "info/unscoped/s/serve-index";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
