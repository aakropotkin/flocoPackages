{

  inputs.packument.url   = "https://registry.npmjs.org/reflect-metadata?rev=50-87bd1d6d5a9ef237d5ff7c66636d4628";
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
    ident = "reflect-metadata";
    ldir  = "info/unscoped/r/reflect-metadata";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
