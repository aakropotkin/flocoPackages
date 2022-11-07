{

  inputs.packument.url   = "https://registry.npmjs.org/classic-level?rev=3-c14b457dc83935ed648275fb7fdaf463";
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
    ident = "classic-level";
    ldir  = "info/unscoped/c/classic-level";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
