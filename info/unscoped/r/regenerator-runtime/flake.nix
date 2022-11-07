{

  inputs.packument.url   = "https://registry.npmjs.org/regenerator-runtime?rev=46-172597335ee3ca6574976d472ef1a7b7";
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
    ident = "regenerator-runtime";
    ldir  = "info/unscoped/r/regenerator-runtime";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
