{

  inputs.packument.url   = "https://registry.npmjs.org/crypt?rev=10-dd30139d24e7b35ccef2e0fe8d07f3b3";
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
    ident = "crypt";
    ldir  = "info/unscoped/c/crypt";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
