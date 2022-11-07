{

  inputs.packument.url   = "https://registry.npmjs.org/mime-db?rev=99-0f9e52ee445e29bd12ef309bbd0b6a6e";
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
    ident = "mime-db";
    ldir  = "info/unscoped/m/mime-db";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
