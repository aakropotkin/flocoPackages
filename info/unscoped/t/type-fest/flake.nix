{

  inputs.packument.url   = "https://registry.npmjs.org/type-fest?rev=86-c6181e044311c56baf04e007dbab70bc";
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
    ident = "type-fest";
    ldir  = "info/unscoped/t/type-fest";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
