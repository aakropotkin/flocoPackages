{

  inputs.packument.url   = "https://registry.npmjs.org/camelcase?rev=67-3c23ff2ea060a6f90508b3f2e8f42a6b";
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
    ident = "camelcase";
    ldir  = "info/unscoped/c/camelcase";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
