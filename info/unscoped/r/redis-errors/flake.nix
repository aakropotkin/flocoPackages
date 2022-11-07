{

  inputs.packument.url   = "https://registry.npmjs.org/redis-errors?rev=5-52340cd4a841b6871d21962e955c3fa9";
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
    ident = "redis-errors";
    ldir  = "info/unscoped/r/redis-errors";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
