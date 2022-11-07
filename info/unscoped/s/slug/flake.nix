{

  inputs.packument.url   = "https://registry.npmjs.org/slug?rev=222-223d2a3fbba71cca00a47662ca06dfe4";
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
    ident = "slug";
    ldir  = "info/unscoped/s/slug";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
