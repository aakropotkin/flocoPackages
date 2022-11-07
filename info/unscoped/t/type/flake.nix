{

  inputs.packument.url   = "https://registry.npmjs.org/type?rev=27-b8dd7ba27f7e41ef74fa695178be88c7";
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
    ident = "type";
    ldir  = "info/unscoped/t/type";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
