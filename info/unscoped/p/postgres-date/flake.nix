{

  inputs.packument.url   = "https://registry.npmjs.org/postgres-date?rev=15-3155943c54b62b146baa8f363050e578";
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
    ident = "postgres-date";
    ldir  = "info/unscoped/p/postgres-date";
    inherit packument fetchInfo;
  } // latest';

}
